import 'package:event_app/MVVM/view_model/event_view_model.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EventTab extends StatefulWidget {
  const EventTab({super.key});

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.error.isNotEmpty) {
        return Center(child: Text(controller.error.value));
      } else if (controller.myEvents.isEmpty) {
        return const Center(child: Text("No events found."));
      }

      return
     Column(
        children: [
          Container(
            height: 40.h,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.myEvents.length,
                itemBuilder: (BuildContext context, int index) {
                  final event = controller.myEvents[index];

                  return Container(
            height: 18.h,
            width: double.infinity,
            margin: EdgeInsets.only(top: 2.h,left: 3.w,right: 3.w,bottom: 2.h),
            padding: EdgeInsets.only( top: 2.h,
               bottom: 1.h, left: 5.w, right: 5.w),
            decoration: BoxDecoration(
              color: AppColors.signinoptioncolor,
              borderRadius: BorderRadius.circular(2.h),

            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.h),

                      child: Image.asset(
                        AppImages.art,
                        height: 10.h,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),

                        Container(
                          width: 50.w,
                          child: Text('${event.eventTitle}',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp)),
                        ),
                        Text('${event.startDate} - ${event.startTime}',
                            style: TextStyle(
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.defaultDialog(
                          backgroundColor: AppColors.backgroundColor,
                          title: "Delete Event",
                          buttonColor: AppColors.blueColor,
                          titleStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blueColor,
                            fontFamily: 'Montserrat',
                          ),
                          confirmTextColor: AppColors.whiteColor,
                          middleTextStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                            fontFamily: 'Montserrat',
                          ),
                          middleText: "Are you sure you want to delete this event?",
                          textConfirm: "Yes",
                          cancelTextColor: AppColors.blueColor,
                          textCancel: "No",
                          onConfirm: () {
                            controller.deleteEvent('${event.eventId}');
                            print('${event.eventId}');
                            Get.back();
                          },
                          onCancel: (){
                            Get.back();

                          }
                        );
                      },
                        child: Icon(Icons.delete_outline,color: AppColors.blueColor)),
                    SizedBox(width: 2.w,),
                    Icon(Icons.edit,color: AppColors.blueColor,),

                  ],
                )
              ],
            ),
                  );

                }
            ),
          )
        ],
      );
    }
    );
  }
}
