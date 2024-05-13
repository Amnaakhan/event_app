import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enentapp/Screens/Auth/forgot_password.dart';
import 'package:enentapp/Screens/Auth/login_screen.dart';
import 'package:enentapp/Screens/Auth/otp_screen.dart';
import 'package:enentapp/Screens/Auth/register.dart';
import 'package:enentapp/Screens/Home/all_tickets.dart';
import 'package:enentapp/Screens/Home/booking_detail.dart';
import 'package:enentapp/Screens/Home/buy_ticket.dart';
import 'package:enentapp/Screens/Home/create_event.dart';
import 'package:enentapp/Screens/Home/donation.dart';
import 'package:enentapp/Screens/Home/edit_profile.dart';

import 'package:enentapp/Screens/Home/event_details.dart';
import 'package:enentapp/Screens/Home/featured_screen.dart';
import 'package:enentapp/Screens/Home/home_screen.dart';
import 'package:enentapp/Screens/Home/live_stream.dart';
import 'package:enentapp/Screens/Home/notification.dart';
import 'package:enentapp/Screens/Home/payment_method.dart';
import 'package:enentapp/Screens/Home/profile_screen.dart';
import 'package:enentapp/Screens/Home/search_screen.dart';
import 'package:enentapp/Screens/Home/select_payment_method.dart';
import 'package:enentapp/Screens/Home/ticket.dart';
import 'package:enentapp/Screens/Onboarding/onboard1.dart';
import 'package:enentapp/Screens/Onboarding/onboard2.dart';
import 'package:enentapp/Screens/Auth/reset_password.dart';
import 'package:enentapp/Screens/create_ad.dart';
import 'package:enentapp/Screens/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlapping_avatar/overlapping_avatar.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';
import 'package:sizer/sizer.dart';

import 'Screens/all_events.dart';

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
          home: LoginScreen(),
        );
      },
    );
  }
}


