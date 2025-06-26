
import 'package:event_app/MVVM/View/ProfileScreen/profile_screen.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../HomeScreen/home_screen.dart';
import '../ProfileScreen/public_profile_screen.dart';
import '../exploreevent/explore_event screen.dart';
import '../ticketScreen/ticket_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _navItems = [
    {'label': 'Home', 'filled': AppImages.homefilledIcon, 'outline': AppImages.homeoutlinedIcon,},
    {'label': 'Explore', 'filled': AppImages.explorefilledIcon, 'outline': AppImages.exploreoutlinedIcon,},
    {'label': 'Tickets', 'filled': AppImages.ticketfilledIcon, 'outline': AppImages.ticketoutlinedIcon,},
    {'label': 'Profile', 'filled': AppImages.profilefilledIcon, 'outline': AppImages.profilefilledIcon,},
  ];
  final List<Widget> _screens =  [
    HomeScreen(),
    ExploreEventScreen(),
    TicketScreen(),
    ProfileScreen(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
          color: AppColors.bottombarcolor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(2.h)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            final bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isSelected ? _navItems[index]['filled']! : _navItems[index]['outline']!,
                    width: 4.h,
                    height: 4.h,
                    color: isSelected ? AppColors.blueColor: Colors.white30,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _navItems[index]['label']!,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ?AppColors.blueColor:Colors.white30,

                      fontFamily: 'Montserrat',

                    )
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
