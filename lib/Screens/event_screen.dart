import 'package:enentapp/Screens/all_events.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'Tabs/upcoming_tab.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with TickerProviderStateMixin {
  int _activeIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                    width: 5.w,
                  ),
                  Text('Events',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp)),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4.h)),
                // color: Colors.purple,
                child: Column(
                  children: [
                    Expanded(
                        child: TabBar(
                      controller: _tabController,

                      indicatorColor: Colors.transparent,
                      // indicatorSize: TabBarIndicatorSize.tab,
                      padding: EdgeInsets.only(bottom: 1.h, top: 1.h),
                      labelColor: Colors.black,
                      labelPadding: EdgeInsets.only(left: 1.w, right: 2.w),
                      dividerColor: Colors.transparent,

                      labelStyle: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15.sp),
                      tabs: [
                        Tab(
                            child: _activeIndex == 0
                                ? Container(
                                    height: double.infinity,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4.h),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff0000000)
                                              .withOpacity(0.3),
                                          blurRadius: 25.0, // soften the shadow
                                          spreadRadius: 0, //extend the shadow
                                          offset: Offset(
                                            0, // Move to right 10  horizontally
                                            8, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                      'UPCOMING',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff5669FF), fontSize: 15.sp),
                                    )))
                                : Container(
                                height: double.infinity,
                                width: 40.w,
                                color: Colors.transparent,
                                child: Center(
                                    child: Text(
                                      'UPCOMING',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff9B9B9B), fontSize: 15.sp),
                                    )))
                        ),
                        Tab(
                            child: _activeIndex == 1
                                ? Container(
                                height: double.infinity,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff0000000)
                                          .withOpacity(0.3),
                                      blurRadius: 25.0, // soften the shadow
                                      spreadRadius: 0, //extend the shadow
                                      offset: Offset(
                                        0, // Move to right 10  horizontally
                                        8, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: Center(
                                    child: Text(
                                      'PAST EVENTS',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff5669FF), fontSize: 15.sp),
                                    )))
                                : Container(
                                height: double.infinity,
                                width: 40.w,
                                color: Colors.transparent,
                                child: Center(
                                    child: Text(
                                      'PAST EVENTS',
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff9B9B9B), fontSize: 15.sp),
                                    )))),
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                height: 70.h,
                width: double.infinity,
                // color: Colors.black,
                child:  TabBarView(
                  controller: _tabController,
                  children: [
                    UpcomingTab(),
                    UpcomingTab()


                  ],
                ),

              ),
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllEvents()),
                    );
                  },
                  child: Container(
                    height: 7.h,
                    width: 70.w,
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
                          child: Text("Explore Events ",
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
              )),
              SizedBox(height: 2.h,)
            ],
          ),
        ),
      ),
    );
  }
}
