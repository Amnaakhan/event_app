import 'package:event_app/MVVM/view_model/auth_view_model.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/button_widget.dart';
import '../../../Widget/input_text_field.dart';
import '../../../app/config/app_asset.dart';
import '../../../app/config/app_pages.dart';
import '../../../app/config/app_text_style.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final authViewModel = Get.put(AuthViewModel());


  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w,bottom: 3.h),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                SizedBox(width: 5.w,),
                Text('Forgot Password',style: TextStyles.profiletext,)
              ],
            ),
            SizedBox(height: 7.h,),
            Image.asset(AppImages.passwordimg,),
            SizedBox(height: 5.h,),

            Align(
              alignment: Alignment.centerLeft,
                child: Text('Enter Your Email',style: TextStyles.regularwhite,)),
            SizedBox(height: 3.h,),

            InputTextField(
              myController: emailController,
              focusNode: emailFocusNode,

              onFieldSubmittedValue: (value) {

                // You can trigger validation or API calls here if necessary
              },
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
              hint: 'Email',
              prefixIcon:  Image.asset(AppImages.emailIcon,height: 1,),


              onValidator: (value) {

              },
            ),
            SizedBox(height: 3.h,),
            ButtonWidget(text: 'Continue', onPressed: (){
              // Navigator.pushReplacementNamed(context, RouteName.otpScreen);
              final email = emailController.text.trim();
              if (email.isNotEmpty) {
               authViewModel.forgotPassword(emailController.text);
              } else {
                Get.snackbar("Error", "Please enter your email");
              }

            },
              backgroundColor: AppColors.blueColor,borderRadius: 4.h,),

          ],
        ),
      ),
    );
  }
}
