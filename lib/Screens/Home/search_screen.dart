import 'package:enentapp/Screens/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text('Search',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp)),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/images/search.png',
                      height: 4.h,
                      color: Color(0xff3D50DF),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp),
                        border: InputBorder.none, // Removes the underline
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BottomSheet(context);
                    },
                    child: Image.asset(
                      'assets/images/filter1.png',
                      height: 4.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventScreen()),
                  );
                },
                child: Container(
                  height: 15.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
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
                      Image.asset(
                        'assets/images/jazz.png',
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Text('1st  May- Sat -2:00 PM',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff5669FF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp)),
                          Container(
                            width: 50.w,
                            child: Text('A virtual evening of smooth jazz',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 15.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
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
                    Image.asset(
                      'assets/images/group.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('1st  May- Sat -2:00 PM',
                            style: GoogleFonts.poppins(
                                color: Color(0xff5669FF),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                        Container(
                          width: 50.w,
                          child: Text('A virtual evening of smooth jazz',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 15.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
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
                    Image.asset(
                      'assets/images/women.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('1st  May- Sat -2:00 PM',
                            style: GoogleFonts.poppins(
                                color: Color(0xff5669FF),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                        Container(
                          width: 50.w,
                          child: Text('A virtual evening of smooth jazz',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 15.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
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
                    Image.asset(
                      'assets/images/mask.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('1st  May- Sat -2:00 PM',
                            style: GoogleFonts.poppins(
                                color: Color(0xff5669FF),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                        Container(
                          width: 50.w,
                          child: Text('A virtual evening of smooth jazz',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 15.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
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
                    Image.asset(
                      'assets/images/gala.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('1st  May- Sat -2:00 PM',
                            style: GoogleFonts.poppins(
                                color: Color(0xff5669FF),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                        Container(
                          width: 50.w,
                          child: Text('A virtual evening of smooth jazz',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
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
                Text('Filter',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp)),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff5669FF),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff5669FF).withOpacity(0.25),
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
                            child: Image.asset(
                              'assets/images/sports_icon.png',
                              height: 4.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('Sports',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Color(0xffE5E5E5))),
                          child: Center(
                            child: Image.asset(
                              'assets/images/music_icon.png',
                              height: 4.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('Music',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff5669FF),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff5669FF).withOpacity(0.25),
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
                            child: Image.asset(
                              'assets/images/art_icon.png',
                              height: 4.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('Art',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Color(0xffE5E5E5))),
                          child: Center(
                            child: Image.asset(
                              'assets/images/food.png',
                              height: 4.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('Food',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('Time & Date',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp)),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 6.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.h),
                          border: Border.all(color: Color(0xffE6E6E6))),
                      child: Center(
                        child: Text('Today',
                            style: GoogleFonts.poppins(
                                color: Color(0xff807A7A),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Color(0xff5669FF),
                        borderRadius: BorderRadius.circular(2.h),
                      ),
                      child: Center(
                        child: Text('Tommorrow',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.h),
                          border: Border.all(color: Color(0xffE6E6E6))),
                      child: Center(
                        child: Text('This week',
                            style: GoogleFonts.poppins(
                                color: Color(0xff807A7A),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                    height: 6.h,
                    width: 70.w,
                    padding: EdgeInsets.only(left: 3.w, right: 5.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.h),
                        border: Border.all(color: Color(0xffE6E6E6))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/calender.png',
                          height: 3.h,
                        ),
                        Text('Choose from calender',
                            style: GoogleFonts.poppins(
                                color: Color(0xff807A7A),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff5669FF),
                          size: 10.sp,
                        )
                      ],
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Text('Location',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp)),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 8.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 3.w, right: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.h),
                      border: Border.all(color: Color(0xffE6E6E6))),
                  child: Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 6.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            image: DecorationImage(
                                image: AssetImage('assets/images/lcard1.png'))),
                        child: Container(
                          height: 4.h,
                          width: 4.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              color: Colors.white),
                          child: Center(
                            child: Image.asset('assets/images/location_img'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('New Yourk, USA',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff5669FF),
                        size: 10.sp,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Image.asset('assets/images/slider.png'),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 6.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.h),
                          border: Border.all(color: Color(0xffE6E6E6))),
                      child: Center(
                        child: Text('Reset',
                            style: GoogleFonts.poppins(
                                color: Color(0xff807A7A),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Color(0xff5669FF),
                        borderRadius: BorderRadius.circular(2.h),
                      ),
                      child: Center(
                        child: Text('Apply',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
}
