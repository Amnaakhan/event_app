import 'package:event_app/MVVM/View/CreateAd/payment_donate_screen.dart';
import 'package:event_app/MVVM/View/paymentMethod/payment_method.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/Widget/input_text_field.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DonationScreen extends StatefulWidget {
  final int? donId;

  const DonationScreen({super.key, required this.donId});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController amountcontroller = TextEditingController();
  final priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
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
                Text('Donation',
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
            Container(
              height: 37.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.signinoptioncolor,

                  borderRadius: BorderRadius.circular(1.h)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/donation.png'),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Donate on right place",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14.sp),
                  ),
                  Text(
                    "Lore ipsum",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Description",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "In publishing and graphic design, Lorem is a placeholder text commonly ",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white, fontSize: 12.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Amount",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            InputTextField(myController: amountcontroller,
                focusNode: priceFocusNode,
                onFieldSubmittedValue: (value){},
                keyBoardType: TextInputType.text, obscureText: false,
                hint: 'Amount', onValidator: (value){}),
            Expanded(

              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(text: 'Donate',onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        PaymentDonateScreen(donaid: widget.donId, donate: amountcontroller.text,)),
                  );
                },
                  borderRadius: 4.h,
                  textColor: AppColors.whiteColor,
                  backgroundColor: AppColors.blueColor,)
              ),
            ),
            SizedBox(height: 2.h,)
          ],
        ),

      ),
    );
  }
}
