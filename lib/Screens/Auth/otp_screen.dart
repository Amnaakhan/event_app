import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:enentapp/Screens/Auth/reset_password.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Padding(
  padding: EdgeInsets.only(top: 7.h,left: 5.w,right: 5.w),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Icon(Icons.arrow_back,color: Colors.black,),
      SizedBox(height: 4.h,),
      Text('Verification',style: GoogleFonts.poppins(
          fontSize: 20.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500
      ),),
      SizedBox(height: 2.h,),

      Container(
        height: 5.h,
        width: 70.w,
        child: Text('We’ve send you the verification code on +1 2620 0323 7631',style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),),
      ),
      SizedBox(height: 4.h,),

      PinCodeTextField(
        keyboardType: TextInputType.number,
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,

        cursorColor:  Color(0xff5669FF),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,

          activeFillColor:
          Colors.white,
          activeColor: Color(0xffE4DFDF),

          selectedFillColor: Colors.white,
          selectedColor: Color(0xff5669FF),
          inactiveColor: Color(0xffE4DFDF),
// disabledColor: Colors.white,
          inactiveFillColor:
          Colors.white,
        ),
        textStyle: GoogleFonts.poppins(
            color: Colors.black),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        // controller: verificationController,
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");

          return true;
        },
        appContext: context,
      ),
      SizedBox(height: 4.h,),

  InkWell(
    onTap: (){
      Get.to(ResetPassword(),transition: Transition.rightToLeft);
    },
    child: Align(
        alignment: Alignment.center,
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
                child: Text("Continue",
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
      ),),
      SizedBox(height: 4.h,),

      Align(
        alignment: Alignment.bottomCenter,
        child: Wrap(
          children: [
            Text('Re-send code in',style: GoogleFonts.poppins(
                fontSize: 10.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400
            )),                Text(' 0:20',style:  GoogleFonts.poppins(
                fontSize: 10.sp,
                color: Color.fromRGBO(86, 105, 255, 1),
                fontWeight: FontWeight.w400
            ),),


          ],
        ),
      ),

    ],
  ),
),
    );
  }
}
