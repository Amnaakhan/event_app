import 'dart:io';

import 'package:event_app/MVVM/View/bottombar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/data_service.dart';
import '../../app/config/app_colors.dart';

class DataViewModel extends GetxController {
  var isFollowing = false.obs;
  var isLoading = false.obs;

  Future<void> toggleFollow() async {
    try {
      final result = await DataService.toggleFollow(

        isFollowing: isFollowing.value,
      );
      Get.snackbar("Success", result['message']);
      isFollowing.toggle();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  Future<void> updateProfile({
    required String name,
    required String shortBio,
    required String interests,
    required File profileImage,
    required String phoneNumber,
  }) async {
    try {
      isLoading.value = true;

      // Replace this token with your dynamic value or secure storage logic

      final response = await DataService.updateUserProfile(
        name: name,
        shortBio: shortBio,
        interests: interests,
        profileImage: profileImage,
        phoneNumber: phoneNumber,
      );

      Get.snackbar("Success", response["message"] ?? "Profile updated successfully.",
        backgroundColor: AppColors.blueColor,
        colorText: AppColors.whiteColor,);
Get.to(BottomNavBar());
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,);
      print('Error ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
