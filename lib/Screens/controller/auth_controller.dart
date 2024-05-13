

import 'package:enentapp/Screens/Auth/login_screen.dart';
import 'package:enentapp/Screens/Auth/otp_screen.dart';
import 'package:enentapp/Screens/Auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../Helper/helper.dart';


class AuthController extends GetxController {


  var userToken = ''.obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  var isLoading = false.obs;

  register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      emailError.value = '';
      passwordError.value = '';
      isLoading.value = true;
      Map<String, String> data = {
        'fullName': name,
        'email': email,
        'password': password,
        'cPassword': password_confirmation,
      };
      final response = await Helpers.post(url: 'auth/CreateAccount', data: data);
      print("Response::$response");

      if (response['statusCode'] == 200) {
        if (response['status'] == 1) {
          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          Get.to(OTPScreen());

          print(response);


        } else {


          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          print(response);
        }

      } else {
        // Handle non200 status codes if necessary
        print("Non-200 status code: ${response['statusCode']}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
  login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
        'deviceUUID':'uiuhi',
        'deviceName':'iphone',
        'deviceOS':'ios',
        'osVersion':'11',
        'fcmToken':'token',
      };
      final response = await Helpers.post(url: 'auth/Authentication', data: data);
      print("response1::$response");
      if (response['statusCode'] == 200) {
        print("Response2::${response}");
        Fluttertoast.showToast(
            msg: 'Logged In successfully', backgroundColor: Colors.blue);
      } else  {
        Fluttertoast.showToast(
          msg: 'Error, try again',

          backgroundColor: Colors.red,
        );
      }
    }catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  forgot_password({required String email}) async {
    try {
      isLoading.value = true;
      var data = {
        'email':email,
      };
      final response =
      await Helpers.post(url: 'auth/ForgotPassword', data: data);
      // print("Data::${response}");
      if (response['statusCode'] == 200) {
        if (response['status'] == 10) {
          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          Get.to(ResetPassword());
          print(response);
        } else {


          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          print(response);
        }

      } else {
        // Handle non200 status codes if necessary
        print("Non-200 status code: ${response['statusCode']}");
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  reset_password({
    required String pass,
    required String email,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'password': pass,
        'email': email,
      };
      final response =
      await Helpers.post(url: 'auth/ResetPassword', data: data);

      if (response['statusCode'] == 200) {
        if (response['status'] == 1) {
          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          Get.to(()=>LoginScreen());
          print(response);
        } else {


          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          print(response);
        }

      } else {
        // Handle non200 status codes if necessary
        print("Non-200 status code: ${response['statusCode']}");
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  verify_email() async {
    try {
      isLoading.value = true;
      var data = {
        'verificationCode': '2626',
        'email': 'shabanaijaz213@gmail.com',
      };
      final response =
      await Helpers.post(url: 'auth/Verify', data: data);

      if (response['statusCode'] == 200) {
        if (response['status'] == 16) {
          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          Get.to(()=>LoginScreen);

          print(response);
        } else {


          Fluttertoast.showToast(
            msg: response['body']['message'],
            backgroundColor: Colors.blue,
          );
          print(response);
        }

      } else {
        // Handle non200 status codes if necessary
        print("Non-200 status code: ${response['statusCode']}");
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }


}