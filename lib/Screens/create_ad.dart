
import 'dart:io';

import 'package:enentapp/Screens/Home/donation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class CreateAd extends StatefulWidget {

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  File? imageFile;

  selectFile() async {
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }

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
                  Image.asset('assets/images/card_img.png'),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UI UX Acdemy",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15.sp),
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
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.h),
                            color: Color(0xff5669FF)),
                        child: Center(
                          child: Text('Addmission',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 10.sp)),
                        ),
                      )
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
            SizedBox(height: 2.h,),
            InkWell(
              onTap: (){
                selectFile();
              },
              child: Container(
                height: 20.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.h),

                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 12, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        10, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Choose File',style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15.sp,
                        fontWeight: FontWeight.w600,

                      ),),
                      SizedBox(width: 2.w,),
                      Image.asset('assets/images/choose_file.png',height: 3.h,)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(

              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    _showDialog(context);

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
                          child: Text("Create Ad",
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
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
        elevation: 0.0,
        alignment: Alignment.center,

        child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(


                  child:Column(
                    children: [
                      Container(
                        height: 10.h,
                          width: 10.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/icon.png'))
                          ),
                        child: Icon(Icons.check,color: Color(0xff3D50DF),size: 40.sp,),
                      ),
                      Container(
                        height: 25.h,
                        padding: EdgeInsets.only(top: 2.h,left: 3.w,right: 3.w),

                        width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/container.png'))
                          ),
                        child: Column(
              children: [
                SizedBox(height: 2.h,),
                Text('Successfully Create AD', style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                    color:  Colors.black,fontSize: 15.sp),
                ),
                SizedBox(height: 2.h,),

                Text(' In publishing and graphic design, Lorem is a placeholder text commonly ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                    color:  Color(0xff626262),fontSize: 9.sp),
                ),
                SizedBox(height: 2.h,),

                InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>DonationScreen()
          ));
    },
                  child: Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff5669FF),
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                    child: Center(
                      child: Text('Got it',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp)),
                    ),
                  ),
                ),
              ],
                        ),
                      ),



                    ],
                  )




              ),
            ),
          ],
        ));
      },
    );
  }
}
