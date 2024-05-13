import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 10.h,
          width: double.infinity,
          child: Center(child: Wrap(
            children: [
              Text('Enjoy your favorite dishe and a lovely'
                  ' your friends and family and have a great time.'
                  ' Food from local food trucks will be available '
                  'for purchase.', style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12.sp,
              )),
              Text('Read More', style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 12.sp,
              )),
            ],
          )),
        ),
      ],
    );
  }
}
