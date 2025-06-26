import 'package:event_app/MVVM/View/paymentMethod/add_card_screen.dart';
import 'package:event_app/MVVM/view_model/payment_view_model.dart';
import 'package:event_app/Services/payment_web_view.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String category;
  final int seats;
  final int? id;

  const PaymentMethodScreen(
      {super.key, required this.category, required this.seats, required this.id});
  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedIndex = 0;
  List<String> paymentOptions = ['PayPal', 'Google Pay', 'Apple Pay'];
  List<String> addedCards = [];
  // final PaymentViewModel paymentViewModel = Get.put(PaymentViewModel());

  @override
  Widget build(BuildContext context) {
    print('category ${widget.category}');
    print('seats ${widget.seats}');
    print('event id ${widget.id}');

    return Scaffold(

      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text('Payment Method',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 15.sp)),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text('Select the payment method you want to use.',
                style: TextStyle(color: Colors.white, fontSize: 11.sp)),
            SizedBox(height: 3.h),
            ...List.generate(paymentOptions.length, (index) {
              return _paymentOptionTile(index, paymentOptions[index]);
            }),
            // Added cards
            ...List.generate(addedCards.length, (index) {
              return _paymentOptionTile(
                  paymentOptions.length + index, addedCards[index]);
            }),
            SizedBox(height: 2.h),
            _addNewCardButton(context),

          ],
        ),
      ),
    );
  }

  Widget _paymentOptionTile(int index, String title) {
    return Card(
      color: AppColors.signinoptioncolor,
      margin: EdgeInsets.only(bottom: 1.5.h),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Radio(
          activeColor: AppColors.blueColor,
          value: index,
          groupValue: selectedIndex,
          onChanged: (value) {
            setState(() {
              selectedIndex = value!;
            });
          },
        ),
      ),
    );
  }

  Widget _addNewCardButton(BuildContext context) {
    return Card(
      color: const Color(0xFF35383F),
      child: ListTile(
        title: Center(
            child: const Text('Add New Card',
                style: TextStyle(color: Colors.white))),
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SquarePaymentPage(
                category: widget.category,
                seats: widget.seats, id: widget.id,
              ),
            ),
          );
        },
      ),
    );
  }


}
