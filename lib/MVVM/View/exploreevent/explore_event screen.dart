import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../../app/config/app_asset.dart';
import '../../../app/config/app_text_style.dart';
import 'event_screen.dart';

class ExploreEventScreen extends StatefulWidget {
  const ExploreEventScreen({super.key});

  @override
  State<ExploreEventScreen> createState() => _ExploreEventScreenState();
}

class _ExploreEventScreenState extends State<ExploreEventScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w,bottom: 5.h),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back,color: AppColors.whiteColor,),
                SizedBox(width: 2.w,),
                Text(
                  "Events",
                  style: TextStyles.tickettext,
                ),
                const Spacer(),
                Image.asset(AppImages.dots,height: 4.h,),
              ],
            ),
             SizedBox(height: 3.h),
            Container(height: 6.h,width: 80.w,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.h),
              color: AppColors.signinoptioncolor
            ),
              child: Row(
                children: [
                  _buildTabButton('Upcoming',0),
                  _buildTabButton('Past Event',1 ),
                ],
              ),
            ),
             SizedBox(height: 10.h),
            Image.asset(
              AppImages.emptyImg, // Add your calendar image here
              height: 30.h,
            ),
             SizedBox(height: 2.h),
            const Text(
              "No Upcoming Event",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Lorem ipsum dolor sit amet,\nconsectetur",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
           Expanded(
             child: Align(alignment: Alignment.bottomCenter,
               child: ButtonWidget(text: 'Explore Events', onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (_) =>  AllEventsScreen()),
                 );
               },backgroundColor: AppColors.blueColor,borderRadius: 4.h,
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
  Widget _buildTabButton(String title, int index) {
    bool isSelected = _tabController.index == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tabController.animateTo(index);
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color:  isSelected ?AppColors.blueColor: AppColors.signinoptioncolor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
                title,
                style: isSelected ? TextStyles.regularhometext2:TextStyles.regularhometextblue
            ),
          ),
        ),
      ),
    );
  }

}



