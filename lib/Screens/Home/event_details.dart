import 'package:enentapp/Screens/Home/featured_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlapping_avatar/overlapping_avatar.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';
import 'package:sizer/sizer.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final List<String> avatarNames = [
     "aasets/images/circle1.png",
    "aasets/images/circle2.png",
     "aasets/images/circle3.png",
  ];
  bool areButtonsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        child: InkWell(
                          onTap: (){
                            BottomSheet(context);

                          },
                          child: Text('Invite',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300
                          ) ,),
                        ),
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
                Stack(
                  children: [
                    Container(
                      height: 18.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 1.w,right: 1.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text('Enjoy your favorite dishe and a lovely your',


                                style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12.sp,
                            )),

                          ),
                          SizedBox(height: 1.h,),
                          Text(
                              'friends and family and have a great time.',

                              style: GoogleFonts.poppins(
                                color: Colors.black38,
                                fontSize: 12.sp,
                              )),
                          SizedBox(height: 1.h,),

                          Text(
                            'Food from local food trucks will be',
                              style: GoogleFonts.poppins(
                                color: Colors.black26,
                                fontSize: 12.sp,
                              )),
                          SizedBox(height: 1.h,),

                          Text(
                              'available for purchase. Read More...',
                              style: GoogleFonts.poppins(
                                color: Colors.black12,
                                fontSize: 12.sp,
                              )),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 13.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Visibility(
                          visible: areButtonsVisible,

                          child: InkWell(
                            onTap: (){
                              setState(() {
                                areButtonsVisible = false; // Hide buttons when tapped
                              });
                            },
                            child: Container(
                              height: 7.h,
                              width: 40.w,
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
                                    child: Text("Book",
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
                        ),
                        Visibility(
                          visible: areButtonsVisible,

                          child: InkWell(
                            onTap: (){
                              setState(() {
                                areButtonsVisible = false; // Hide buttons when tapped
                              });
                            },
                            child: Container(
                              height: 7.h,
                              width: 40.w,
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
                                    child: Text("Host",
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
                        ),
                      ],),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 13.h),
                      child: Visibility(
                        visible: !areButtonsVisible,

                        child: InkWell(
                          onTap: (){
                            setState(() {
                              areButtonsVisible = false; // Hide buttons when tapped
                            });
                          },
                          child: InkWell(
                            onTap: (){
                              Get.to(FeaturedScreen(),transition: Transition.rightToLeft);

                            },
                            child: Container(
                              height: 7.h,
                              width: double.infinity,
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
                                    child: Text("Confirm as Host",
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
                        ),
                      ),
                    ),


                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
            margin: EdgeInsets.only(left: 10.w,right: 10.w),

            child:
            InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeaturedScreen()),
                  );
                },
                child: Image.asset('assets/images/host.png'))




        );
      },
    );
  }


}
void BottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isScrollControlled: true,

      context: context,
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 3.h, right: 3.w, left: 3.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  3.h,
                ),
                topLeft: Radius.circular(3.h))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h,),

            Text('Invite Friend',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp)),
            SizedBox(height: 2.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4.h),

              ),
              child: TextFormField(
                // controller: eventcontroller,
                decoration: InputDecoration(
                  fillColor:Colors.transparent,
                  filled: true,
                  hintText: "search",
                  suffixIcon: Icon(Icons.search),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffD0D5DD),
                    ),
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                  errorStyle: GoogleFonts.poppins(),
                  hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(116, 118, 136, 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:               Colors.black,

                    ),
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                  focusColor:  Colors.black,

                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                cursorColor: Colors.black,
                style: GoogleFonts.montserrat(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 14,
                ),
              ),
            ),

            Stack(
              children: [
                Image.asset('assets/images/invite_pic.png'),
               Padding(
                 padding: EdgeInsets.only(top: 70.h),
                 child: Container(
                      height: 7.h,
                      width: double.infinity,
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
                            child: Text("Invite ",
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

              ],
            )


          ],
        ),
      ));
}


