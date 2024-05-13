import 'package:enentapp/Screens/Home/booking_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Featured',style: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,

        ),),
        leading: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 3.h,left: 5.w,right: 5.w),
          child: Column(
            children: [
              InkWell(

                child: Container(
                  height: 17.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 1.h),
                  decoration: BoxDecoration(
                      color: Color(0xff131212).withOpacity(0.47),

                        image: DecorationImage(
                          image: AssetImage('assets/images/img3.png'
                          ),
                            fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode( Color(0xff131212).withOpacity(0.47), BlendMode.darken),

                        ),
                      borderRadius: BorderRadius.circular(1.h)
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Container(
                          width:70.w,
                          // color: Colors.white,
                          child: Text('International Band Music Concert',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                          ),),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BookingDetails()),
                            );
                          },
                          child: Container(
                            height: 3.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                                color: Color(0xff3D50DF),

                                borderRadius: BorderRadius.circular(4.h)
                            ),
                            child: Center(child: Text('Book',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8.sp
                            ))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 1.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/img4.png'
                        ),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode( Color(0xff131212).withOpacity(0.47), BlendMode.darken),

                    ),
                    borderRadius: BorderRadius.circular(1.h)
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width:70.w,
                        // color: Colors.white,
                        child: Text('International Band Music Concert',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                        ),),
                      ),
                      Container(
                        height: 3.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                            color: Color(0xff3D50DF),
        
                            borderRadius: BorderRadius.circular(4.h)
                        ),
                        child: Center(child: Text('Book',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8.sp
                        ))),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 1.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/img5.png'
                        ),
                        fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode( Color(0xff131212).withOpacity(0.47), BlendMode.darken),


                    ),
                    borderRadius: BorderRadius.circular(1.h)
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width:70.w,
                        // color: Colors.white,
                        child: Text('International Band Music Concert',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                        ),),
                      ),
                      Container(
                        height: 3.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                            color: Color(0xff3D50DF),
        
                            borderRadius: BorderRadius.circular(4.h)
                        ),
                        child: Center(child: Text('Book',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8.sp
                        ))),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 1.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/img7.png'
                        ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode( Color(0xff131212).withOpacity(0.47), BlendMode.darken),

                    ),
                    borderRadius: BorderRadius.circular(1.h)
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width:70.w,
                        // color: Colors.white,
                        child: Text('International Band Music Concert',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                        ),),
                      ),
                      Container(
                        height: 3.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                            color: Color(0xff3D50DF),
        
                            borderRadius: BorderRadius.circular(4.h)
                        ),
                        child: Center(child: Text('Book',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8.sp
                        ))),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 17.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 1.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/images/img3.png'
                        ),
                        fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode( Color(0xff131212).withOpacity(0.47), BlendMode.darken),


                    ),
                    borderRadius: BorderRadius.circular(1.h)
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width:70.w,
                        // color: Colors.white,
                        child: Text('International Band Music Concert',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                        ),),
                      ),
                      Container(
                        height: 3.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                            color: Color(0xff3D50DF),
        
                            borderRadius: BorderRadius.circular(4.h)
                        ),
                        child: Center(child: Text('Book',style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8.sp
                        ))),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
