import 'package:enentapp/Screens/Home/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
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
                Text('Profile',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp)),
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
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              child: Container(
                height: 8.h,width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(color: Color(0xff5669FF))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/edit_icon.png',height: 4.h,),
                    Text('Edit Profile',
                        style: GoogleFonts.poppins(
                            color: Color(0xff5669FF),
                            fontSize: 12.sp)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),

            Align(
              alignment: Alignment.centerLeft,
              child: Text('About Me',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp)),
            ),
            SizedBox(height: 2.h,),

            Container(
              height: 10.h,
              width: double.infinity,
              child: Center(child: Wrap(
                children: [
                  Text('Enjoy your favorite dishe and a lovely'
                      ' your friends and family and have a great time.'
                      ' Food from local food trucks will be available '
                      'for purchase.', style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12.sp,
                  )),
                  Text('Read More', style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontSize: 12.sp,
                  )),
                ],
              )),
            ),
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Interest',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp)),
              Container(height: 4.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.h),
                  color: Color(0xff4AD2E4).withOpacity(0.18)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/edit_image.png',height: 2.h,),
                    Text('Change',style: GoogleFonts.poppins(
                        color: Color(0xff5669FF),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp))
                  ],
                ),
              )
              // Image.asset('assets/images/change_button.png',height: 7.h,)
            ],),
            SizedBox(height: 2.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Image.asset('assets/images/game.png',height: 4.h,),
              Image.asset('assets/images/concert.png',height: 4.h,),
              Image.asset('assets/images/music_img.png',height: 4.h,),
              Image.asset('assets/images/art.png',height: 4.h,),




            ],),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Image.asset('assets/images/movie.png',height: 4.h,),
                SizedBox(width: 2.w,),
                Image.asset('assets/images/others.png',height: 4.h,),



              ],)


          ],
        ),

      ),
    );
  }
}
