import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text('Notifications',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp)),
                Spacer(),
                Icon(Icons.more_vert)
              ],
            ),

            SizedBox(
              height: 15.h,
            ),
            Center(
                child: Image.asset(
              'assets/images/art_work.png',
              height: 30.h,
            )),
            Text('No Notifications!',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp)),
            SizedBox(
              height: 2.h,
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Color(0xff344B67),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp))

          ],
        ),
      ),
    );
  }
}
