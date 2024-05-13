import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class EventTab extends StatelessWidget {
  const EventTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return               Container(
          height: 15.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 2.h,left: 3.w,right: 3.w,bottom: 2.h),
          padding: EdgeInsets.only(
              top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.h),
            boxShadow: [
              BoxShadow(
                color: Color(0xff535990).withOpacity(0.3),
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 0, //extend the shadow
                offset: Offset(
                  0, // Move to right 10  horizontally
                  8, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/jazz.png',
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Text('1st  May- Sat -2:00 PM',
                      style: GoogleFonts.poppins(
                          color: Color(0xff5669FF),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp)),
                  Container(
                    width: 50.w,
                    child: Text('A virtual evening of smooth jazz',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp)),
                  )
                ],
              )
            ],
          ),
                );

              }
          ),
        )
      ],
    );
  }
}
