import 'package:event_app/MVVM/View/CreateAd/create_ad.dart';
import 'package:event_app/MVVM/View/exploreevent/create_event.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../app/config/app_colors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),

        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
               
              ],
            ),
            SizedBox(height: 3.h,),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateEvent()
                  ),
                );
              },
              child: Container(
                height: 7.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.signinoptioncolor,
                  borderRadius: BorderRadius.circular(2.h)
                ),
                child: Center(
                  child: Text('Create Event', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',

                      fontSize: 15.sp),),
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>CreateAd()
                  ),
                );
              },
              child: Container(
                height: 7.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.signinoptioncolor,
                    borderRadius: BorderRadius.circular(2.h)
                ),
                child: Center(
                  child: Text('Create Ad', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',

                      fontSize: 15.sp),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
