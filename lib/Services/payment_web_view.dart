// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:http/http.dart' as http;
//
// class SquarePaymentWebView extends StatefulWidget {
//   const SquarePaymentWebView({super.key});
//
//   @override
//   State<SquarePaymentWebView> createState() => _SquarePaymentWebViewState();
// }
//
// class _SquarePaymentWebViewState extends State<SquarePaymentWebView> {
//   late final WebViewController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onNavigationRequest: (request) {
//             final url = request.url;
//
//             // Detect if URL contains the payment_nonce
//             if (url.contains("payment_nonce=")) {
//               final uri = Uri.parse(url);
//               final nonce = uri.queryParameters["payment_nonce"];
//
//               if (nonce != null && nonce.isNotEmpty) {
//                 _callBookingApi(nonce); // Pass the nonce to Laravel
//               }
//
//               return NavigationDecision.prevent; // Stop navigation
//             }
//
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(""
//           ""));
//   }
//
//   Future<void> _callBookingApi(String nonce) async {
//     final url = Uri.parse("https://eventgo-live.com/api/v1/events/3/book");
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': 'Bearer ',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           "ticket_type": "gold",
//           "quantity": 2,
//           "payment_nonce": nonce,
//           "save_card": true,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data['success'] == true) {
//           // ✅ Show success message
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text("Payment Success"),
//               content: Text("Ticket booked successfully! 🎉"),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text("OK"),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           _showError("API failed: ${data['message']}");
//         }
//       } else {
//         _showError("Server error: ${response.statusCode}");
//       }
//     } catch (e) {
//       _showError("Error: $e");
//     }
//   }
//
//   void _showError(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Square Payment")),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }

import 'dart:convert';
import 'package:event_app/MVVM/View/bottombar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app/config/app_colors.dart';

class SquarePaymentPage extends StatefulWidget {



  final String category;
  final int seats;
  final int? id;


  const SquarePaymentPage({super.key, required this.category, required this.seats, required this.id});

  @override
  State<SquarePaymentPage> createState() => _SquarePaymentPageState();
}

class _SquarePaymentPageState extends State<SquarePaymentPage> {
  late final WebViewController _controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterWebView',
        onMessageReceived: (JavaScriptMessage message) async {
          final nonce = message.message;
          print('Received Square Token (nonce): $nonce');
          await sendToBackend(nonce);
        },
      )
      ..setNavigationDelegate(NavigationDelegate())
      ..loadRequest(Uri.parse('https://eventgo-live.com/square-payment/${widget.id}'));
  }



  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }


  @override
  Widget build(BuildContext context) {
    print('event id ${widget.id}');

    print('category ${widget.category}');
    print('seats ${widget.seats}');
    return Scaffold(
      appBar: AppBar(title: Text('Complete Payment')),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  Future<void> sendToBackend(String nonce) async {
    setState(() => isLoading = true);
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    try {
      final response = await http.post(
        Uri.parse('https://eventgo-live.com/api/v1/events/${widget.id}/book'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', // Add this
        },
        body: jsonEncode({
          'ticket_type': 'gold',
          'quantity': widget.seats,
          'payment_nonce': nonce,
          'save_card': true,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, true);
        showSuccessDialog(context);
      } else {
        print('Payment failed: ${response.body}');
        _showSnackbar("Payment failed!");
      }
    } catch (e) {
      print('Exception: $e');
      _showSnackbar("Something went wrong!");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor:AppColors.signinoptioncolor, // Dark background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circle with check icon and dots (you can replace with animation or custom painter if needed)
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 20),

              const Text(
                "Congratulations!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "You have successfully placed an order for National Music Festival. Enjoy the event!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  AppColors.blueColor,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                },
                child: const Text("View E-Ticket",style: TextStyle(color: AppColors.whiteColor),),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white60),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
