import 'package:event_app/MVVM/view_model/auth_view_model.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/input_text_field.dart';
import '../../../Widget/social_card.dart';
import '../../../app/config/app_asset.dart';
import '../../../app/config/app_pages.dart';
import '../../../app/config/app_strings.dart';
import '../../../app/config/app_text_style.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SigninScreen> {
  final _keyForm = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authViewModel = Get.put(AuthViewModel());

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  bool _isObscure = true; // Controls password visibility

  bool isChecked = false; // Checkbox state

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.logo2,
                    height: 12.h,
                  )),
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(AppStrings.loginText,
                    style: TextStyles.heading),
              ),
              SizedBox(
                height: 5.h,
              ),

              Form(

                key: _keyForm,
                child: Column(
                  children: [

                    InputTextField(
                      myController: emailController,
                      focusNode: emailFocusNode,

                      onFieldSubmittedValue: (value) {

                        // You can trigger validation or API calls here if necessary
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email',
                      prefixIcon:
                      Image.asset(AppImages.emailIcon,height: 1,),

                      onValidator: (value) {},
                      onChanged: (value) {
                        authViewModel.emailError.value = '';
                      },
                    ),
                    Obx(() => authViewModel.emailError.value.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Text(
                        authViewModel.emailError.value,
                        style: TextStyle(color: Colors.red, fontSize: 10.sp),
                      ),
                    )
                        : SizedBox.shrink()),
                    SizedBox(height: 2.h,),
                    InputTextField(
                      myController: passwordController,
                      focusNode: passwordFocusNode,
                      onFieldSubmittedValue: (value) {},
                      keyBoardType: TextInputType.text,
                      obscureText: _isObscure,
                      hint: AppStrings.hintpasswordtText,
                      prefixIcon: Image.asset(AppImages.passwordIcon),
                      suffixIcon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.white,),
                      onSuffixIconPress: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });

                      },
                      onChanged: (value) {
                        authViewModel.passwordError.value = '';
                      },
                      onValidator: (value) {

                      },
                    ),
                    Obx(() => authViewModel.passwordError.value.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Text(
                        authViewModel.passwordError.value,
                        style: TextStyle(color: Colors.red, fontSize: 10.sp),
                      ),
                    )
                        : SizedBox.shrink()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked,

                          activeColor: AppColors.blueColor,
                          // Checkbox color
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyles.regularwhite// Checkbox state
                          ,
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                        ButtonWidget(
                      text: AppStrings.signinText,
                      onPressed: () {
                        authViewModel.login(emailController.text, passwordController.text);
                      },
                      backgroundColor: AppColors.blueColor,
                      borderRadius: 4.h,
                    ),
                    SizedBox(height: 3.h,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, RouteName.forgotpassword);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(AppStrings.forgotpassText,style: TextStyles.regulartext,),
                      ),
                    ),
                    SizedBox(height: 3.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(AppStrings.continueText,
                              style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialCard( image: AppImages.googleIcon, onPressed: () {  },),
                        SocialCard( image: AppImages.facebookIcon, onPressed: () {  },),
                        SocialCard( image: AppImages.appleIcon, onPressed: () {  },),

                      ],
                    ),
                    SizedBox(height: 3.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.accountText,
                          style: TextStyles.regularwhite,
                        ),
                        SizedBox(width: 1.w,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, RouteName.signupScreen);

                          },
                          child: Text(
                              AppStrings.signupText,
                              style: TextStyles.regulartext
                          ),
                        ),
                      ],
                    ),

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
