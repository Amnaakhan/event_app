import 'package:enentapp/Screens/create_ad.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  Text('Events',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp)),
                  Spacer(),
                  Icon(Icons.search,color: Colors.black,),
        
                  Icon(Icons.more_vert,color: Colors.black,)
                ],
              ),
              SizedBox(height: 5.h,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAd()),
                  );
                },
                child: Container(
                  height: 17.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 2.h,bottom: 2.h,left: 5.w,right: 3.w),
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
                      Image.asset('assets/images/group.png',
                      ),
                      SizedBox(width: 2.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Wed, Apr 28 •5:30 PM',style: GoogleFonts.poppins(
                              color: Color(0xff5669FF),
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp)),
                          SizedBox(height: 1.h,),

                          Container(
                            width: 50.w,
                            child: Text('Jo Malone London’s Mother’s Day Presents',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp)),
                          ),
                        SizedBox(height: 1.h,),
                          Row(
                            children: [
                              Icon(Icons.location_pin,size: 15.sp,color: Color(0xff747688),),
                              Text('Radius Gallery•Santa Cruz, CA',style: GoogleFonts.poppins(
                                  color: Color(0xff747688),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.sp)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.h,bottom: 2.h,left: 5.w,right: 5.w),
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
                    Image.asset('assets/images/jazz.png',
                    ),
                    SizedBox(width: 2.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        Text('Sat, May 1 •2:00 PM',style: GoogleFonts.poppins(
                            color: Color(0xff5669FF),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp)),
                        SizedBox(height: 1.h,),
        
                        Container(
                          width: 50.w,
                          child: Text('A virtual evening of smooth jazz',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp)),
                        ),
                        SizedBox(height: 1.h,),
        
                        Row(
                          children: [
                            Icon(Icons.location_pin,size: 15.sp,color: Color(0xff747688),),
                            Text('Lot 13 • Oakland, CA',style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 9.sp)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
        
              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.h,bottom: 2.h,left: 5.w,right: 5.w),
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
                    Image.asset('assets/images/women.png',
                    ),
                    SizedBox(width: 2.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        Text('Sat, Apr 24 •1:30 PM',style: GoogleFonts.poppins(
                            color: Color(0xff5669FF),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp)),
                        SizedBox(height: 1.h,),
        
                        Container(
                          width: 50.w,
                          child: Text('Women`s Leadership Conference 2021',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp)),
        
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            Icon(Icons.location_pin,size: 15.sp,color: Color(0xff747688),),
                            Text('53 Bush St•San Francisco,CA',style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 9.sp)),
                          ],
                        ),
        
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
        
              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.h,bottom: 2.h,left: 5.w,right: 3.w),
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
                    Image.asset('assets/images/mask.png',
                    ),
                    SizedBox(width: 2.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        Text('Fri, Apr 23 •6:00 PM',style: GoogleFonts.poppins(
                            color: Color(0xff5669FF),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp)),
                        SizedBox(height: 1.h,),
        
                        Container(
                          width: 55.w,
                          child: Text('International Kids Safe Parents Night Out',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp)),
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            Icon(Icons.location_pin,size: 15.sp,color: Color(0xff747688),),
                            Text('Lot 13 • Oakland, CA',style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 9.sp)),
                          ],
                        ),
        
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.h,bottom: 2.h,left: 5.w,right: 3.w),
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
                    Image.asset('assets/images/night_out.png',
                    ),
                    SizedBox(width: 2.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Mon, Jun 21•10:00 PM',style: GoogleFonts.poppins(
                            color: Color(0xff5669FF),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp)),
                        SizedBox(height: 1.h,),

                        Container(
                          width: 55.w,
                          child: Text('Collectivity Plays the Music of Jimi ',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp)),
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            Icon(Icons.location_pin,size: 15.sp,color: Color(0xff747688),),
                            Text('Longboard Margarita Bar',style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 9.sp)),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.h,bottom: 2.h,left: 5.w,right: 3.w),
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
                    Image.asset('assets/images/gala.png',
                    ),
                    SizedBox(width: 2.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Sun, Apr 25•10:15 AM',style: GoogleFonts.poppins(
                            color: Color(0xff5669FF),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp)),
                        SizedBox(height: 1.h,),

                        Container(
                          width: 55.w,
                          child: Text('International Gala Music Festival',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp)),
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            Icon(Icons.location_pin,size: 15.sp,color: Color(0xff747688),),
                            Text('36 Guild Street London, UK  ',style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 9.sp)),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),



            ],
          ),
        ),
      ),
    );
  }
}
