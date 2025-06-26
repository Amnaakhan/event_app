import 'package:event_app/MVVM/View/bottombar/bottom_navigation_bar.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../app/config/app_asset.dart';
import '../../../app/config/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Ensure context is available before preloading images
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage(AppImages.welcomeImg), context);

      Future.delayed(Duration(seconds: 3), ()async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        if (token != null ) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    BottomNavBar()),
          );
          // User is logged in — navigate to your home or dashboard screen
        } else {
          // User not logged in — navigate to welcome/login screen
          Navigator.pushReplacementNamed(context, RouteName.onboardScreen);
        }      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset(AppImages.logo2,height: 15.h,),
        

      ),
    );
  }
}
