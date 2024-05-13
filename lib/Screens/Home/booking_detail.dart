import 'package:enentapp/Screens/Home/buy_ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';
import 'package:sizer/sizer.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 27.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 6.h,left: 5.w,right: 5.w),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/img2.png'),fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back,color: Colors.white,),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text('Event Details',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp
                          ),),
        
                          Spacer(),
                          Image.asset('assets/images/share.png',height: 5.h,),
                          SizedBox(
                            width: 4.w,
                          ),
                          Image.asset('assets/images/fav_icon.png',height: 5.h,)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 7.h,
                  padding: EdgeInsets.only(left: 5.w,right: 5.w),
                  margin: EdgeInsets.only(top: 24.h,left: 8.w,right: 8.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
        
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff5A5A5A).withOpacity(0.10),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: Offset(0,20)
                        ),
                      ],
        
                      borderRadius: BorderRadius.circular(4.h)),
                  child: Row(
                    children: [
                      OverlapAvatar(
                          insideRadius : 20,
                          outSideRadius: 20,
                          widthFactor : 0.6 ,
                          backgroundImage: AssetImage('assets/images/circle1.png'),
                          itemCount: 3,
        
                          groupWidth: 25.w,
                          backgroundColor : Colors.white
                      ),
                      Text('+20 Going',style: GoogleFonts.poppins(
                          color: Color(0xff3F38DD),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                      ),),
                      Spacer(),
                      Container(
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Color(0xff5669FF),
                          borderRadius: BorderRadius.circular(1.h),
        
        
        
                        ),
                        child: Center(
                          child: Text('Invite',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300
                          ) ,),
                        ),
                      )
                    ],
                  ),
                )
        
        
              ],
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('International Band Music Concert',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 22.sp
                    ),),
                  SizedBox(height: 3.h,),
                  Row(
                    children: [
                      Image.asset('assets/images/date.png',height: 5.h,),
                      SizedBox(width: 3.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('14 December, 2023',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp
                            ),),
                          Text('Tuesday, 4:00PM - 9:00PM',
                            style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp
                            ),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 3.h,),
        
                  Row(
                    children: [
                      Image.asset('assets/images/location.png',height: 5.h,),
                      SizedBox(width: 3.w,),
        
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
        
                        children: [
                          Text('Gala Convention Center',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp
                            ),),
                          Text('36 Guild Street London, UK ',
                            style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp
                            ),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 3.h,),
        
                  Row(
                    children: [
                      Image.asset('assets/images/pic.png',height: 5.h,),
                      SizedBox(width: 3.w,),
        
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
        
                        children: [
                          Text('RK Design',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp
                            ),),
                          Text('Organizer',
                            style: GoogleFonts.poppins(
                                color: Color(0xff747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp
                            ),),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Color(0xffEBEDFF),
                          borderRadius: BorderRadius.circular(1.h),
        
        
        
                        ),
                        child: Center(
                          child: Text('Follow',style: GoogleFonts.poppins(
                              color: Color(0xff5669FF),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300
                          ) ,),
                        ),
                      )
                      // Image.asset('assets/images/follow.png',height: 7.h,)
                    ],
                  ),
                  SizedBox(height: 3.h,),
        
                  Text('About Event',style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600
                  ) ,),
                 Container(
                   height: 10.h,
                   width: double.infinity,
                   child: Center(child: Wrap(
                     children: [
                       Text('Enjoy your favorite dishe and a lovely your '
                           'friends and family and have a great time. Food from local'
                           ' food trucks will be available for purchase.', style: GoogleFonts.poppins(
                         color: Colors.black,
                         fontSize: 12.sp,
                       )),
                       Text('Read More...', style: GoogleFonts.poppins(
                         color: Colors.blue,
                         fontSize: 12.sp,
                       )),
                     ],
                   )),
                 ),
                  SizedBox(height: 7.h,),
        
                  Container(
                    height: 8.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 3.w,right: 3.w),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1.h),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000).withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: Offset(0,2)
                        ),
                      ],
                    ),
                    child: Row(

                      children: [
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFEBA37)
                          ),
                          child: Center(child: Container(
                            height: 3.h,
                            width: 3.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF2F2F2)
                            ),
                          ),),
                        ),
                        SizedBox(width: 5.w,),
                        Padding(padding: EdgeInsets.only(top: 1.5.h),
                          child: Column(
                            children: [
                              Text('Gold package',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              )),
                              Text('Loreipsum text',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 8.sp,
                              )),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(padding: EdgeInsets.only(top: 1.5.h),
                          child: Column(
                            children: [
                              Text('235\$',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              )),
                              Text('fee   2%',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,

                              )),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    height: 8.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 3.w,right: 3.w),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1.h),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000).withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: Offset(0,2)
                        ),
                      ],
                    ),
                    child: Row(

                      children: [
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffD9D9D9)
                          ),
                          child: Center(child: Container(
                            height: 3.h,
                            width: 3.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF2F2F2)
                            ),
                          ),),
                        ),
                        SizedBox(width: 5.w,),
                        Padding(padding: EdgeInsets.only(top: 1.5.h),
                          child: Column(
                            children: [
                              Text('Silver package',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              )),
                              Text('Loreipsum text',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 8.sp,
                              )),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(padding: EdgeInsets.only(top: 1.5.h),
                          child: Column(
                            children: [
                              Text('124\$',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              )),
                              Text('fee   2%',style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,

                              )),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BuyATicket()),
                      );
                    },
                    child: Container(
                      height: 7.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 5.w,right: 5.w),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(86, 105, 255, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(11, 126, 201, 0.25),
                            blurRadius: 25, // soften the shadow
                            spreadRadius: 0, //extend the shadow

                          )
                        ],
                        borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                      ),
                      child: Stack(

                        children: [


                          Center(
                            child: Text("Confirm Booking",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                                  color:  Colors.white,fontSize: 13.sp),),
                          ),

                          Positioned(
                            right: 3.w,
                            top: 1.5.h,
                            child: Container(height: 4.h,width: 4.h,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(61, 86, 240, 1),
                                  shape: BoxShape.circle
                              ),
                              child: Icon(Icons.arrow_forward,color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
