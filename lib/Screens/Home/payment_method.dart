import 'package:enentapp/Screens/Home/select_payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/app_bar1.png'),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Bank',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h,),

                  Image.asset('assets/images/bank.png'),
                  SizedBox(height: 2.h,),

                  Image.asset('assets/images/bank1.png'),
                  SizedBox(height: 2.h,),

                  Text(
                    'Others',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Image.asset('assets/images/bank2.png'),
                  SizedBox(height: 2.h,),
                  Image.asset('assets/images/bank3.png'),
                  SizedBox(height: 2.h,),
                  Image.asset('assets/images/bank4.png'),
                  SizedBox(height: 3.h,),

                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectPaymentMethod()),
                      );
                    },
                    child: Container(
                      height: 7.h,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Color(0xff5669FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
