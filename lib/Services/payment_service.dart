// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:square_in_app_payments/in_app_payments.dart';
// import 'package:square_in_app_payments/models.dart';
//
// class PaymentService {
//   final String baseUrl = "https://eventgo-live.com/api/v1/events/3/book";
//
//   // Function to start Square Card Entry and get payment nonce
//   Future<String?> getSquarePaymentNonce() async {
//     try {
//       await InAppPayments.setSquareApplicationId('YOUR_SQUARE_APP_ID');
//       String? nonce;
//
//       await InAppPayments.startCardEntryFlow(
//         onCardNonceRequestSuccess: (CardDetails result) async {
//           nonce = result.nonce;
//           await InAppPayments.completeCardEntry(onCardEntryComplete: () {});
//         },
//         onCardEntryCancel: () {
//           // handle cancel if needed
//         },
//       );
//
//       return nonce;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // Book event payment via your API
//   Future<Map<String, dynamic>> bookEventPayment({
//     required String ticketType,
//     required int quantity,
//     required String paymentNonce,
//     required bool saveCard,
//   }) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         "Authorization": "Bearer your_token_here",
//         "Content-Type": "application/json",
//       },
//       body: jsonEncode({
//         "ticket_type": ticketType,
//         "quantity": quantity,
//         "payment_nonce": paymentNonce,
//         "save_card": saveCard,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception("Payment failed: ${response.body}");
//     }
//   }
// }
