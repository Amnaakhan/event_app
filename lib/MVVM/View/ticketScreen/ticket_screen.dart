import 'package:event_app/MVVM/View/ticketScreen/ticketTab/canceled_tab.dart';
import 'package:event_app/MVVM/View/ticketScreen/ticketTab/completed_tab.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:event_app/app/config/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TicketScreen extends StatefulWidget {
  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                child: Row(
                  children: [
                     Text(
                      "Tickets",
                      style: TextStyles.tickettext,
                    ),
                    const Spacer(),
                    Image.asset(AppImages.searchIcon,height: 4.h,),
                     SizedBox(width: 3.w),
                    Image.asset(AppImages.dots,height: 4.h,),
                  ],
                ),
              ),
               TabBar(
                labelColor: Colors.white,
                indicatorColor: AppColors.blueColor,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Text('Upcoming',
                      style: TextStyles.tabtext,

                    ),
                      ),
                  Tab(child: Text('Completed',
                    style: TextStyles.tabtext,

                  ),),
                  Tab(child: Text('Cancelled',
                    style: TextStyles.tabtext,

                  ),),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: const Divider(color: AppColors.tabtextcolor, height: 1)),
               Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("Upcoming Events", style: TextStyle(color: Colors.white))),
                    CompletedTab(),
                    CancelledTab()                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}