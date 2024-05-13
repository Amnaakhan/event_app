import 'package:enentapp/Screens/Home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 37.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 12, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        8, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(1.h)),
              child: Column(
                children: [
                  Image.asset('assets/images/donation.png'),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Donate on right place",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 14.sp),
                          ),
                          Text(
                            "Lore ipsum",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 13.sp),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 3.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.h),
                            color: Color(0xff5669FF)),
                        child: Center(
                          child: Text('Donate',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 10.sp)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Description",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "In publishing and graphic design, Lorem is a placeholder text commonly ",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Color(0xff626262), fontSize: 12.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "In publishing and graphic design, Lorem is a placeholder text commonly ",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Color(0xff626262), fontSize: 12.sp),
            ),
            Expanded(

              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(

                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
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
                          child: Text("Donate",
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
            SizedBox(height: 2.h,)
          ],
        ),

      ),
    );
  }
}
