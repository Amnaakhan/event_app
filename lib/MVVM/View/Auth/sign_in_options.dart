import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:event_app/app/config/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/sign_in_card.dart';
import '../../../app/config/app_pages.dart';
import '../../../app/config/app_text_style.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            SizedBox(
              height: 3.h,
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.logo,
                  height: 27.h,
                )),
            SizedBox(
              height: 3.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(AppStrings.welcoeText,
                   style: TextStyles.heading),
            ),
            SizedBox(
              height: 2.h,
            ),
            SignInCard(
              text: AppStrings.googleText,
              onPressed: () {},
              image: AppImages.facebookIcon,
            ),
            SizedBox(
              height: 2.h,
            ),
            SignInCard(
              text: AppStrings.googleText,
              onPressed: () {},
              image: AppImages.googleIcon,
            ),
            SizedBox(
              height: 2.h,
            ),
            SignInCard(
              text: AppStrings.appleText,
              onPressed: () {},
              image: AppImages.appleIcon,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(color: Colors.grey, thickness: 0.5),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text("or",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                ),
                Expanded(
                  child: Divider(color: Colors.grey, thickness: 0.5),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            ButtonWidget(
              text: 'Sign in with Password',
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteName.signupScreen);

              },
              backgroundColor: AppColors.blueColor,
              borderRadius: 4.h,
            ),
            SizedBox(
              height: 2.h,
            ),
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
                    // Navigate to signup screen
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
      ),
    );
  }
}
