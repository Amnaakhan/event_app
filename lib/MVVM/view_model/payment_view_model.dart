// import 'package:event_app/Services/payment_service.dart';
// import 'package:get/get.dart';
//
// class PaymentViewModel extends GetxController {
//   var isLoading = false.obs;
//   final PaymentService _paymentService = PaymentService();
//   var addedCards = <String>[].obs;
//
//   // Get Square Payment Nonce and add card label to list
//   Future<void> addNewCard() async {
//     try {
//       final nonce = await _paymentService.getSquarePaymentNonce();
//       if (nonce != null) {
//         addedCards.add('**** **** **** (Token)');
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//
//   // Book payment using Square nonce
//   Future<void> bookPayment({
//     required String ticketType,
//     required int quantity,
//     required String paymentNonce,
//     required bool saveCard,
//   }) async {
//     isLoading.value = true;
//     try {
//       final response = await _paymentService.bookEventPayment(
//         ticketType: ticketType,
//         quantity: quantity,
//         paymentNonce: paymentNonce,
//         saveCard: saveCard,
//       );
//
//       if (response['success'] == true) {
//         Get.snackbar("Success", "Booking ID: ${response['booking_id']}");
//       } else {
//         Get.snackbar("Failed", "Something went wrong");
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
