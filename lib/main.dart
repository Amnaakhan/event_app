

import 'package:event_app/MVVM/View/CreateAd/create_ad.dart';
import 'package:event_app/MVVM/View/CreateAd/donation.dart';
import 'package:event_app/MVVM/View/HomeScreen/home_screen.dart';
import 'package:event_app/MVVM/View/UsersData/invite_user_list.dart';
import 'package:event_app/MVVM/View/bookEvent/book_event_screen.dart';
import 'package:event_app/MVVM/View/bottombar/bottom_navigation_bar.dart';
import 'package:event_app/MVVM/View/exploreevent/event_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'MVVM/View/AccountSetup/verify_email.dart';
import 'MVVM/View/CreateAd/add_screen.dart';
import 'MVVM/View/CreateAd/ads_detail_screen.dart';
import 'MVVM/View/CreateAd/all_ads_screen.dart';
import 'MVVM/View/splash/splash_screen.dart';

import 'MVVM/view_model/event_view_model.dart';
import 'app/config/app_routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType)
    {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        onGenerateRoute: Routes.generateRoute,

      );
    });
  }
}


