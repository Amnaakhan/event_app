import 'package:enentapp/Screens/Components/input_text.dart';
import 'package:enentapp/Screens/controller/auth_controller.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Padding(
            padding: EdgeInsets.only(top: 7.h,left: 5.w,right: 5.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Icon(Icons.arrow_back,color: Colors.black,),
                  SizedBox(height: 4.h,),
                  Text('Forgot Password',style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 2.h,),

                  Container(
                    height: 5.h,
                    width: 70.w,
                    child: Text('Please enter your email address to request a password reset',style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),),
                  ),
                  SizedBox(height: 4.h,),
                  InputText(placeholder: 'abc@email.com', controller: emailController,
                    image: Image.asset('assets/images/mail.png',height: 2.h,),),
                  SizedBox(height: 4.h,),

                  Obx(()=> authController.isLoading.value?Center(child: CircularProgressIndicator(),):
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          if (emailController.text.isEmpty) {
                            Get.snackbar("Error", "Please Enter your email",
                                backgroundColor:
                                Color.fromRGBO(61, 86, 240, 1),
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,

                                margin: EdgeInsets.only(
                                    bottom: 15.h, left: 5.w, right: 5.w));
                          }else{
                          authController.forgot_password(email: emailController.text);}
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
                                child: Text("Send",
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

                ]
            )


        )
    );
  }
}
