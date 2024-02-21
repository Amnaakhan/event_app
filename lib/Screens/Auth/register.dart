import 'package:enentapp/Screens/Components/input_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:enentapp/Screens/Auth/otp_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 7.h,left: 5.w,right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back,color: Colors.black,),
              SizedBox(height: 4.h,),
              Text('Sign in',style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 4.h,),

              InputText(placeholder: 'Full name', controller: nameController,
                image: Image.asset('assets/images/profile.png',height: 2.h,),),
              SizedBox(height: 2.h,),
              InputText(placeholder: 'abc@email.com', controller: nameController,
                image: Image.asset('assets/images/mail.png',height: 2.h,),),
              SizedBox(height: 2.h,),
              InputText(placeholder: 'Your password', controller: emailController,
                icon: Icons.visibility_off_rounded,
                image: Image.asset('assets/images/lock.png',height: 2.h,),),
              SizedBox(height: 2.h,),
              InputText(placeholder: 'Confirm password', controller: emailController,
                icon: Icons.visibility_off_rounded,
                image: Image.asset('assets/images/lock.png',height: 2.h,),),
              SizedBox(height: 5.h,),

              InkWell(
                onTap: (){
                  Get.to(OTPScreen(),transition: Transition.rightToLeft);
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
                        child: Text("SIGN IN",
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
              SizedBox(height: 3.h,),

              Align(
                alignment: Alignment.center,

                child: Text('OR',style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Color.fromRGBO(157, 152, 152, 1),
                    fontWeight: FontWeight.w500
                )),
              ),
              SizedBox(height: 2.h,),

              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 7.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(211, 212, 226, 0.25),
                        blurRadius: 30, // soften the shadow
                        spreadRadius: 0, //extend the shadow

                      )
                    ],
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Image.asset('assets/images/google.png',height: 3.h,),
                      Text("Login with Google",style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      )),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 7.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(211, 212, 226, 0.25),
                        blurRadius: 30, // soften the shadow
                        spreadRadius: 0, //extend the shadow

                      )
                    ],
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      Image.asset('assets/images/facebook.png',height: 3.h,),
                      Text("Login with Facebook",style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      )),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.h,),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      Text('Don’t have an account?',style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      )),                Text('Signin',style:  GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: Color.fromRGBO(86, 105, 255, 1),
                          fontWeight: FontWeight.w400
                      ),),


                    ],
                  ),
                ),

              SizedBox(height: 2.h,)

            ],
          ),
        ),
      ),
    );
  }
}
