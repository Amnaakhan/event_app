import 'package:event_app/MVVM/View/AccountSetup/verify_email.dart';
import 'package:event_app/MVVM/View/Auth/sign_in.dart';
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
import '../../view_model/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _keyForm = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  final AuthViewModel controller = Get.put(AuthViewModel());

  final emailFocusNode = FocusNode();
  final namFocusNode = FocusNode();
  final confrmpassFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();
  bool _isObscure = true; // Controls password visibility

  bool isChecked = false; // Checkbox state
  bool _isObscureConfirm = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmpassController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    namFocusNode.dispose();
    confrmpassFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
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
                child: Text(AppStrings.createaccountText,
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
                      myController: nameController,
                      focusNode: namFocusNode,
                      onFieldSubmittedValue: (value) {
                        // You can trigger validation or API calls here if necessary
                      },
                      keyBoardType: TextInputType.name,
                      obscureText: false,
                      hint: 'Name',
                      prefixIcon: Image.asset(
                        AppImages.profile,
                        height: 2,
                      ),
                      onValidator: (value) {},
                    ),

                    Obx(() => controller.nameError.value.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 0.8.h),
                      child: Text(
                        controller.nameError.value,
                        style: TextStyle(color: Colors.red, fontSize: 10.sp),
                      ),
                    )
                        : SizedBox.shrink()),
                    SizedBox(
                      height: 2.h,
                    ),
                    InputTextField(
                      myController: emailController,
                      focusNode: emailFocusNode,
                      onFieldSubmittedValue: (value) {
                        // You can trigger validation or API calls here if necessary
                      },
                      keyBoardType: TextInputType.emailAddress,
                      obscureText: false,
                      hint: 'Email',
                      prefixIcon: Image.asset(
                        AppImages.emailIcon,
                        height: 1,
                      ),
                      onValidator: (value) {},
                    ),
                    Obx(() => controller.emailError.value.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 0.8.h),
                      child: Text(
                        controller.emailError.value,
                        style: TextStyle(color: Colors.red, fontSize: 10.sp),
                      ),
                    )
                        : SizedBox.shrink()),
                    SizedBox(
                      height: 2.h,
                    ),
                    InputTextField(
                      myController: passwordController,
                      focusNode: passwordFocusNode,
                      onFieldSubmittedValue: (value) {},
                      keyBoardType: TextInputType.text,
                      obscureText: _isObscure,
                      hint: AppStrings.hintpasswordtText,
                      prefixIcon: Image.asset(AppImages.passwordIcon),
                      suffixIcon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onSuffixIconPress: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      onValidator: (value) {},
                    ),
                    Obx(() => controller.passwordError.value.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 0.8.h),
                      child: Text(
                        controller.passwordError.value,
                        style: TextStyle(color: Colors.red, fontSize: 10.sp),
                      ),
                    )
                        : SizedBox.shrink()),
                    SizedBox(
                      height: 2.h,
                    ),
                    InputTextField(
                      myController: confirmpassController,
                      focusNode: confrmpassFocusNode,
                      onFieldSubmittedValue: (value) {},
                      keyBoardType: TextInputType.text,
                      obscureText: _isObscureConfirm,
                      hint: 'Confirm Password',
                      prefixIcon: Image.asset(AppImages.passwordIcon),
                      suffixIcon: Icon(
                        _isObscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onSuffixIconPress: () {
                        setState(() {
                          _isObscureConfirm = !_isObscureConfirm;
                        });
                      },
                      onValidator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    Obx(() => controller.confirmPasswordError.value.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.only(top: 0.8.h),
                      child: Text(
                        controller.confirmPasswordError.value,
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
                          style: TextStyles.regularwhite // Checkbox state
                          ,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Obx(()=>
                       ButtonWidget(
                        text: AppStrings.signupText,
                        isLoading: controller.isLoading.value,
                        onPressed: () {
                          controller.signup(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text,
                            confirmpassController.text,
                          );
                        },
                        backgroundColor: AppColors.blueColor,
                        borderRadius: 4.h,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(AppStrings.continueText,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp)),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialCard(
                          image: AppImages.googleIcon,
                          onPressed: () {},
                        ),
                        SocialCard(
                          image: AppImages.facebookIcon,
                          onPressed: () {},
                        ),
                        SocialCard(
                          image: AppImages.appleIcon,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyText,
                          style: TextStyles.regularwhite,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SigninScreen());
                            // Navigate to signup screen
                          },
                          child: Text(AppStrings.signinText,
                              style: TextStyles.regulartext),
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
