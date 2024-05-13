import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LiveStream extends StatefulWidget {
  const LiveStream({super.key});

  @override
  State<LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/screenshot.png'), fit: BoxFit.fill)),

        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         Image.asset(
        //           'assets/images/pic1.png',
        //           height: 7.h,
        //         ),
        //         SizedBox(
        //           width: 3.w,
        //         ),
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "Tim South",
        //               style: GoogleFonts.poppins(
        //                 fontWeight: FontWeight.w600,
        //                 color: Colors.white,
        //                 fontSize: 13.sp,
        //               ),
        //             ),
        //             Text(
        //               "233k viewers",
        //               style: GoogleFonts.poppins(
        //                 fontWeight: FontWeight.w400,
        //                 color: Colors.white,
        //                 fontSize: 13.sp,
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(width: 3.w,),
        //         Container(
        //           height: 4.h,
        //           width: 20.w,
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(3.h)),
        //           child:  Center(
        //             child: Text(
        //               "Follow",
        //               style: GoogleFonts.poppins(
        //                 fontWeight: FontWeight.w500,
        //                 color: Color(0xff3D50DF),
        //                 fontSize: 13.sp,
        //               ),
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //
        //         Row(
        //           children: [
        //             Container(
        //               height: 6.h,
        //               width: 6.h,
        //               decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: Color(0xff3D50DF)
        //               ),
        //               child: ,
        //             )
        //           ],
        //         )
        //
        //   ],
        // ),

      ),
    );
  }
}
