import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/MVVM/View/CreateAd/add_screen.dart';
import 'package:event_app/MVVM/view_model/event_view_model.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../app/config/app_text_style.dart';
import '../EventDetailScreen/event_detail_screen.dart';
import '../bottombar/bottom_navigation_bar.dart';

class AllEventsScreen extends StatefulWidget {
  @override
  State<AllEventsScreen> createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BottomNavBar()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.whiteColor,
                    )),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Events",
                  style: TextStyles.tickettext,
                ),
Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) =>
                          AddScreen()),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator(color: Colors.white));
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (controller.events.isEmpty) {
                  return Center(
                    child: Text("No events available", style: TextStyle(color: Colors.white)),
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.events.length,
                    itemBuilder: (context, index) {
                      final event = controller.events[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) =>
                                      EventDetailScreen(eventId: '${event.eventId}',)),
                                );
                          print('id = ${event.eventId}');
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 2.h),
                          padding:
                              EdgeInsets.only(left: 3.w, right: 3.w, bottom: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.signinoptioncolor,
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 2.h,),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2.h),
                                    child:

                                    CachedNetworkImage(
                                      imageUrl:'https://eventgo-live.com/${event.eventImage}',
                                      width: 14.h,
                                      height: 14.h,
                                      fit: BoxFit.cover, // You can also try BoxFit.contain for a more fitting size
                                      placeholder: (context, url) =>
                                      Center(child: Container()),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.h,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${event.eventTitle}',
                                              style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 1.h),
                                          Text('${formatDate(event.startDate)} - ${formatTime(event.startTime)}',
                                              style: const TextStyle(
                                                  color: AppColors.blueColor,
                                                  fontSize: 13)),
                                          SizedBox(height: 1.h),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_pin,
                                                  color: AppColors.blueColor,
                                                  size: 16),
                                              SizedBox(width: 3.w),
                                              Expanded(
                                                child: Text('${event.address} ${event.city}',

                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 10)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
  String? formatDate(String? date) {
    try {
      final parsedDate = DateTime.parse(date!);
      return DateFormat('EEEE, MMMM d, y').format(parsedDate);
    } catch (e) {
      return date; // fallback in case of error
    }
  }

  String? formatTime(String? time) {
    try {
      final parsedTime = DateFormat("HH:mm:ss").parse(time!);
      return DateFormat("hh:mm a").format(parsedTime);
    } catch (e) {
      return time;
    }
  }
}
