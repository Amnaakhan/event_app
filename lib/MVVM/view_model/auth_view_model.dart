


import 'dart:convert';

import 'package:event_app/MVVM/View/AccountSetup/account_setup_screnn.dart';
import 'package:event_app/MVVM/View/AccountSetup/otp_screen.dart';
import 'package:event_app/MVVM/View/AccountSetup/verify_email.dart';
import 'package:event_app/MVVM/View/Auth/sign_in.dart';
import 'package:event_app/MVVM/View/bottombar/bottom_navigation_bar.dart';
import 'package:event_app/MVVM/body_model/login_model.dart';
import 'package:event_app/MVVM/body_model/user_list_model.dart';
import 'package:event_app/Services/auth_service.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../View/AccountSetup/password_setting.dart';



class AuthViewModel extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<LoginModel>();
  final RxList<Data> users = <Data>[].obs;
  var registeredEmail = ''.obs;
  var nameError = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  var error = ''.obs;

  void clearErrors() {
    nameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';
  }
  final AuthService _authService = AuthService();

  @override
  void onInit() {
fetchUsers();
    super.onInit();
  }
  void login(String email, String password) async {
    // Input validation
    if (email.isEmpty) {
      emailError.value = "Email is required";
      return;
    }
    if (password.isEmpty) {
      passwordError.value = "Password is required";
      return;
    }

    isLoading.value = true;

    try {
      var response = await AuthService.loginUser(email, password, true);

      if (response['message'] == 'Login successful') {
        // Save token
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['token']);
        await prefs.setInt('userid', response['user']['userId']);  // 👈 save user id here

        Get.snackbar(
          'Success',
          response['message'],
          backgroundColor: AppColors.blueColor,
          colorText: AppColors.whiteColor,
        );

        // Navigate if needed
        Get.to(AccountSetupScreen());
      } else {
        Get.snackbar(
          'Error',
          response['message'] ?? 'Something went wrong',
          backgroundColor: AppColors.blueColor,
          colorText: AppColors.whiteColor,
        );
      }
    } catch (e) {
      if (e.toString().contains('Failed to login')) {
        // Response error from API call
        final errorMessage = e.toString().split(': ').last;

        Get.snackbar(
          'Error',
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Unexpected error
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }


  void signup(String name, String email, String password, String confirmPassword) async {
    clearErrors();
    isLoading.value = true;

    try {
      var response = await AuthService.registerUser(
          name, email, password, confirmPassword);

      print('API response: $response');

      int statusCode = response['statusCode'];

      if (statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('registered_email', email);
        // Success
        Get.snackbar('Success', response['message'],
            backgroundColor: AppColors.blueColor, colorText: Colors.white);

        // Navigate to verify screen
        // Get.off(() => VerifyEmail());
      } else if (statusCode == 422) {
        // Validation Errors
        var errors = response['errors'];

        nameError.value = errors['name'] != null ? errors['name'][0] : '';
        emailError.value = errors['email'] != null ? errors['email'][0] : '';
        passwordError.value =
        errors['password'] != null ? errors['password'][0] : '';
        confirmPasswordError.value = errors['password_confirmation'] != null
            ? errors['password_confirmation'][0]
            : '';

        // Also show main message as snackbar if you want
        if (response['message'] != null) {
          Get.snackbar('Error', response['message'],
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        // Fallback unexpected response
        Get.snackbar('Error', response['message'] ?? 'Unexpected error occurred.',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

Future<void> verifyEmail(String code) async {
    isLoading.value = true;
    error.value = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('registered_email');

      final result = await AuthService.verifyEmail(
        email: email,
        verificationCode: code,
      );

      if (result.containsKey('message')) {
        Get.snackbar("Verification", result['message'], backgroundColor: AppColors.blueColor,
          colorText: AppColors.whiteColor,);
        Get.to(SigninScreen);
      } else {
        Get.snackbar("Verification", "Unknown response", backgroundColor: AppColors.blueColor,
          colorText: AppColors.whiteColor,);
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar("Exception", error.value);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> forgotPassword(String email) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await AuthService.forgotPassword(email: email);

      if (result.containsKey('message')) {
        Get.snackbar("Success", result['message'], backgroundColor: AppColors.blueColor,
          colorText: AppColors.whiteColor,);
        // Navigate to OTP screen if required
        Get.to(() => OTPScreen());
      } else {
        Get.snackbar("Error", "Unexpected response");
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar("Exception", error.value, backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> verifyPasswordOtp( String otp) async {
    isLoading.value = true;
    error.value = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('registered_email');
      final result = await AuthService.verifyPasswordOtp(email: email, otp: otp);

      if (result.containsKey('message')) {
        Get.snackbar("Success", result['message']);
        // Proceed to reset password screen
        Get.to(() =>PasswordSetting ());
      } else {
        Get.snackbar("Error", "Unexpected response", backgroundColor: Colors.red,
          colorText: AppColors.whiteColor,);
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar("Exception", error.value);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    isLoading.value = true;
    error.value = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('registered_email');
      final result = await AuthService.resetPassword(
        email: email,
        password: password,
        passwordConfirmation: confirmPassword,
      );

      if (result.containsKey('message')) {
        Get.snackbar("Success", result['message'], backgroundColor: AppColors.blueColor,
          colorText: AppColors.whiteColor,);
        // Navigate to login or home screen
        Get.offAll(() => SigninScreen());
      } else {
        Get.snackbar("Error", "Unexpected response", backgroundColor: Colors.red,
          colorText: AppColors.whiteColor,);
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar("Exception", error.value);
    } finally {
      isLoading.value = false;
    }
  }
  void fetchUsers() async {
    try {
      isLoading.value = true;
      final response = await _authService.fetchUsers();
      users.assignAll(response.data ?? []);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }


    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userid = prefs.getString('userid');

    print("Saved token: $token");}
}
