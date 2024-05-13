import 'package:enentapp/Screens/Home/notification.dart';
import 'package:enentapp/Screens/Tabs/about_tab.dart';
import 'package:enentapp/Screens/Tabs/review_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Tabs/event_tab.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with TickerProviderStateMixin {

  int _activeIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);

  }
  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(height: 3.h,),
              Image.asset('assets/images/profile_img.png',height: 15.h,),
              SizedBox(height: 3.h,),

              Text('Tim South',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp)),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('350',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp)),
                      Text('Following',
                          style: GoogleFonts.poppins(
                              color: Color(0xff747688),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp)),
                    ],
                  ),
                  Container(height: 5.h,width: 1,color: Color(0xffDDDDDD),),
                  Column(
                    children: [
                      Text('346',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp)),
                      Text('Followers',
                          style: GoogleFonts.poppins(
                              color: Color(0xff747688),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 7.h,width: 40.w,
                    decoration: BoxDecoration(
                        color: Color(0xff5669FF),
                        borderRadius: BorderRadius.circular(2.h),
                        border: Border.all(color: Color(0xff5669FF))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/follow_icon.png',height: 4.h,),
                        Text('Follow',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.sp)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationScreen()),
                      );
                    },
                    child: Container(
                      height: 7.h,width: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.h),
                          border: Border.all(color: Color(0xff5669FF))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/message.png',height: 4.h,),
                          Text('Massages',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff5669FF),
                                  fontSize: 12.sp)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 5.h,
                width: double.infinity,
                // color: Colors.purple,

                child:Column(
                  children: [
                    Expanded( child:
                    TabBar(
                      controller: _tabController,

                      indicatorColor: Color(0xff3D50DF),
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.only(bottom: 1.h),
                      labelColor: Colors.black,
                      labelPadding: EdgeInsets.only(left: 1.w, right: 2.w),
                      dividerColor: Colors.transparent,

                      labelStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp), tabs: [
                      Tab(
                          child:
                          _activeIndex== 0?
                          Text('About',style:  GoogleFonts.poppins(color: Color(0xff5669FF),
                               fontSize: 13.sp),):
                          Text('About',style:  GoogleFonts.poppins(color: Color(0xff64748B), fontSize: 13.sp))

                      ),
                      Tab(
                          child:
                          _activeIndex== 1?
                          Text('Events',style:  GoogleFonts.poppins(color: Color(0xff5669FF), fontSize: 13.sp),):
                          Text('Events',style:  GoogleFonts.poppins(color: Color(0xff64748B), fontSize: 13.sp))

                      ),
                      Tab(
                          child:
                          _activeIndex== 2?
                          Text('Reviews',style:  GoogleFonts.poppins(color: Color(0xff5669FF), fontSize: 13.sp),):
                          Text('Reviews',style:  GoogleFonts.poppins(color: Color(0xff64748B), fontSize: 13.sp))

                      ),
                    ],)),
                  ],
                ) ,
              ),
              SizedBox(height: 2.h,),

              Container(height: 40.h,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AboutTab(),
                    EventTab(),
                    ReviewTab(),


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
