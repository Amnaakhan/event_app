import 'dart:io';

import 'package:event_app/MVVM/view_model/data_view_model.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:event_app/app/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/button_widget.dart';
import '../../../Widget/input_text_field.dart';
import '../bottombar/bottom_navigation_bar.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final dataViewModel = Get.put(DataViewModel());

  final nameController = TextEditingController();
  final interestController = TextEditingController();
  final aboutController = TextEditingController();
  final phoneController = TextEditingController();

  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(width: 5.w),
                Text('Fill Your Profile', style: TextStyles.profiletext),
              ],
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                profileImage != null ? FileImage(profileImage!) : null,
                backgroundColor: Colors.black12,
                child: profileImage == null
                    ? Image.asset(AppImages.editProfile)
                    : null,
              ),
            ),
            SizedBox(height: 5.h),
            InputTextField(
              myController: nameController,
              hint: 'Full Name',
              obscureText: false,
              keyBoardType: TextInputType.name,
              onValidator: (val) {},
              focusNode: FocusNode(),
              onFieldSubmittedValue: (_) {},
            ),
            SizedBox(height: 2.h),
            InputTextField(
              myController: interestController,
              hint: 'Interest',
              obscureText: false,
              keyBoardType: TextInputType.text,
              onValidator: (val) {},
              focusNode: FocusNode(),
              onFieldSubmittedValue: (_) {},
            ),
            SizedBox(height: 2.h),
            InputTextField(
              myController: aboutController,
              hint: 'About',
              obscureText: false,
              keyBoardType: TextInputType.text,
              onValidator: (val) {},
              focusNode: FocusNode(),
              onFieldSubmittedValue: (_) {},
            ),
            SizedBox(height: 2.h),
            InputTextField(
              myController: phoneController,
              hint: 'Phone Number',
              obscureText: false,
              keyBoardType: TextInputType.phone,
              onValidator: (val) {},
              focusNode: FocusNode(),
              onFieldSubmittedValue: (_) {},
            ),
            const Spacer(),
            Obx(() {
              final isUpdating = dataViewModel.isLoading.value;

              return ButtonWidget(
                text: isUpdating ? "Updating..." : "Continue",
                onPressed: () {
                  if (isUpdating) return;

                  if (profileImage == null) {
                    Get.snackbar("Error", "Please select a profile image",);
                    return;
                  }

                  dataViewModel.updateProfile(
                    name: nameController.text.trim(),
                    shortBio: aboutController.text.trim(),
                    interests: interestController.text.trim(),
                    profileImage: profileImage!,
                    phoneNumber: phoneController.text.trim(),
                  ).then((_) {
                  });
                },
                backgroundColor: AppColors.blueColor,
                borderRadius: 4.h,
              );

            }),
          ],
        ),
      ),
    );
  }
}
