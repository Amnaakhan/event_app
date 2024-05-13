import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/create_event.png',
          height: 30.h,
        ),
        Container( height: 5.h,
          width: 60.w,
        // color: Colors.black,
          child: Center(child: Text('No Upcoming Event',style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp
          ),),),
        ),
        Container( height: 5.h,
          width: 60.w,
          // color: Colors.black,
          child: Center(child: Text('Lorem ipsum dolor sit amet, consectetur ',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Color(0xff747688),
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,

          ),),),
        )
      ],
    );
  }
}
