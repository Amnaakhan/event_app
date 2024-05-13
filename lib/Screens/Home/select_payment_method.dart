import 'package:enentapp/Screens/Home/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 6.h),

        child: Column(
          children: [
            Image.asset('assets/images/app_bar1.png'),
            SizedBox(height: 2.h,),
            Image.asset('assets/images/card.png',
            height: 20.h,),
            SizedBox(height: 3.h,),
            Container(height: 15.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 5.w,right: 5.w),
              padding: EdgeInsets.only(top:1.h,left: 5.w,right: 5.w),

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.h),
              border: Border.all( color: Color(0xffE5E7EB)),
             ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Enter Amount', style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B7280),
                      fontSize: 10.sp,
                    ),),
                    Spacer(),
                    Text('Payment method', style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B7280),
                      fontSize: 10.sp,
                    ),),
              SizedBox(width: 2.w,),
              Image.asset('assets/images/stripe.png',height: 3.h,),


                ],),
                  SizedBox(height: 2.h,),

                  Row(
                    children: [
                      Image.asset('assets/images/usd.png',height: 4.h,),
                       Expanded(
                         child: TextField(
                           keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Search',

                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp
                              ),
                              border: InputBorder.none, // Removes the underline

                            ),
                          ),
                       ),
                      Spacer(),
                      Text('fee   2%',style: GoogleFonts.poppins(
                        color: Color(0xff6B7280),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,

                      )),

                    ],
                  ),


                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,

                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ticket()),
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
              ),
            ),
            SizedBox(height: 2.h,)



          ],
        ),
      ),
    );
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 10.w,right: 10.w),

          child:
            Image.asset('assets/images/booking_dailog.png')




        );
      },
    );
  }

}
