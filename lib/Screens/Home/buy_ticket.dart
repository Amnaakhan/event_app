import 'package:dotted_border/dotted_border.dart';
import 'package:enentapp/Screens/Home/payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BuyATicket extends StatefulWidget {
  const BuyATicket({Key? key}) : super(key: key);

  @override
  State<BuyATicket> createState() => _BuyATicketState();
}

class _BuyATicketState extends State<BuyATicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/app_bar.png'),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tickets type',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 4.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.h),
                          color: Color(0xff3D50DF),
                        ),
                        child: Center(
                          child: Text(
                            'VIP',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 4.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.h),
                          border: Border.all(color: Color(0xff3D50DF), width: 1),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Economy',
                            style: GoogleFonts.poppins(
                              color: Color(0xff3D50DF),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Quality',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  DottedBorder(
                    dashPattern: [10, 10],
                    strokeWidth: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      height: 10.h,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 6.h,
                            width: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.5.h),
                              color: Color(0xffABADBC).withOpacity(0.50),
                            ),
                            child: Icon(Icons.remove, color: Color(0xff3D50DF)),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                          ),
                          Container(
                            height: 6.h,
                            width: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.5.h),
                              color: Color(0xffABADBC).withOpacity(0.50),
                            ),
                            child: Icon(Icons.remove, color: Color(0xff3D50DF)),
                          ),
                        ],
                      ),
                    ),
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
                      MaterialPageRoute(builder: (context) => PaymentMethod()),
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
}