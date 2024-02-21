import 'package:enentapp/Screens/Auth/login_screen.dart';
import 'package:enentapp/Screens/Auth/otp_screen.dart';
import 'package:enentapp/Screens/Auth/register.dart';
import 'package:enentapp/Screens/Onboarding/onboard1.dart';
import 'package:enentapp/Screens/Onboarding/onboard2.dart';
import 'package:enentapp/Screens/Auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,


          home: Onboard1(),
        );
      },
    );
  }
}
