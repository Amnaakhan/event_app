import 'package:event_app/MVVM/view_model/auth_view_model.dart';
import 'package:event_app/Widget/input_text_field.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/button_widget.dart';
import '../../../app/config/app_asset.dart';
import '../../../app/config/app_pages.dart';
import '../../../app/config/app_strings.dart';
import '../../../app/config/app_text_style.dart';



class PasswordSetting extends StatefulWidget {
  const PasswordSetting({super.key});

  @override
  State<PasswordSetting> createState() => _PasswordSettingState();
}

class _PasswordSettingState extends State<PasswordSetting> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  final passwordFocusNode = FocusNode();
  final passwordFocusNode1 = FocusNode();

  bool _isObscure = true; // Controls password visibility

  bool isChecked = false;

  bool _isObscure1 = true; // Controls password visibility
  final authViewModel = Get.put(AuthViewModel());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController1.dispose();
    passwordController.dispose();

    passwordFocusNode1.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                Text('Create new Password',style: TextStyles.profiletext,)
              ],
            ),
            SizedBox(height: 8.h,),
            Image.asset(AppImages.passwordsetting,),
            SizedBox(height: 5.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Create Your New Password',
                  style: TextStyles.regularwhite,)),
            SizedBox(height: 3.h,),
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

              onValidator: (value) {

              },
            ),
            SizedBox(height: 2.h,),

            InputTextField(
              myController: passwordController1,
              focusNode: passwordFocusNode1,
              onFieldSubmittedValue: (value) {},
              keyBoardType: TextInputType.text,
              obscureText: _isObscure1,
              hint: AppStrings.hintpasswordtText,
              prefixIcon: Image.asset(AppImages.passwordIcon),
              suffixIcon: Icon(
                _isObscure1 ? Icons.visibility_off : Icons.visibility,color: Colors.white,),
              onSuffixIconPress: () {
                setState(() {
                  _isObscure1 = !_isObscure1;
                });

              },

              onValidator: (value) {

              },
            ),
            SizedBox(height: 2.h,),

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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(text: 'Continue', onPressed: (){
                  // showSuccessDialog(context);
                  // Navigator.pushReplacementNamed(context, RouteName.account);
                  final password = passwordController.text.trim();
                  final confirmPassword = passwordController1.text.trim();

                  if (password == confirmPassword && password.isNotEmpty) {
                    authViewModel.resetPassword(
                      password: password,
                      confirmPassword: confirmPassword,
                    );
                  } else {
                    Get.snackbar("Error", "Passwords do not match or are empty");
                  }

                },
                  backgroundColor: AppColors.blueColor,borderRadius: 4.h,),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
