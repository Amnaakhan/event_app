import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
Stack(
  children: [
    Container(
      height: 28.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/img.png'),fit: BoxFit.fill)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 7.h,left: 7.w,right: 7.w),
        child: Column(
          children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/drawer.png',height: 3.h,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Current Location',style: GoogleFonts.poppins(color: Colors.white,
                  fontSize: 10.sp,
                ),),
                Icon(Icons.arrow_drop_down_outlined,color: Colors.white,
                )
              ],
            ),
            Text('New York, USA',style: GoogleFonts.poppins(color: Colors.white,
              fontSize: 10.sp,
            ),)

          ],
        ),
        Image.asset('assets/images/noti.png',height: 5.h,),


      ],
    ),
                SizedBox(height: 3.h,),

                Row(
                  children: [
                    Image.asset('assets/images/search.png',height: 5.h,),
    SizedBox(width: 2.w,),
                    Expanded(
                      child: TextField(
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
    Image.asset('assets/images/filter.png',height: 5.h,),

                  ],
                ),




          ],
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: 25.h,left: 4.w,right: 1.w),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Container(
           height: 5.h,
           width: 28.w,
           decoration: BoxDecoration(
             color: Color(0xffF0635A),
             borderRadius: BorderRadius.circular(30)
           ),
           child: Center(
             child:
Image.asset('assets/images/sports.png',height: 3.h,)
           ),
         ),
          Container(
            height: 5.h,
            width: 27.w,
            decoration: BoxDecoration(
                color: Color(0xffF59762),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
                child:
                Image.asset('assets/images/music.png',height: 3.h,)
            ),
          ),
          Container(
            height: 5.h,
            width: 35.w,
            decoration: BoxDecoration(
                color: Color(0xff29D697),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
                child:Row(
                  children: [
                    Image.asset('assets/images/live.png',height: 2.5.h,),
                    Image.asset('assets/images/stream.png',height: 2.5.h,),


                  ],
                )
            ),
          )

        ],
      ),
    )
  ],
),
          Padding(
            padding: EdgeInsets.only(left: 5.w,right: 5.w,top: 5.h),
            child: Row(
              children: [
                Text('Upcoming Events',style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),),
                Spacer(),
                Text('See All',style: GoogleFonts.poppins(
                  color: Color(0xff747688)
                ),),
                Icon(Icons.arrow_right,
                    color: Color(0xff747688)
                )
              ],
            ),
          ),
          SizedBox(height: 2.h,),

Container(
  height: 35.h,
  width: double.infinity,
  color: Colors.white,
  // padding: EdgeInsets.only(top: 2.h,bottom: 2.h),

  child: ListView.builder(
    itemCount: 10,
    scrollDirection: Axis.horizontal,

    itemBuilder: (context, index) {

      return
Container(
  height: double.infinity,
  width: 60.w,
  margin: EdgeInsets.only(left: 2.w,right: 2.w,top: 2.h,bottom: 2.h),
  padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 1.h,bottom: 1.h),

  decoration: BoxDecoration(
    color: Color(0xffFFFFFF),
    borderRadius: BorderRadius.circular(1.h),
    boxShadow: [
      BoxShadow(
        color: Color(0xff505588).withOpacity(0.10),
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],

  ),
  child: Column(
    children: [

    ],
  ),
);
    },
  ),
)
        ],
      ),
    );
  }
}
