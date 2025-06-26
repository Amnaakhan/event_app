import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/MVVM/view_model/event_view_model.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_style.dart';
import '../EventDetailScreen/event_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 7.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImages.profileicon,
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.morningtext,
                                style: TextStyles.regularhometext,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                AppStrings.nametext,
                                style: TextStyles.regularhometext1,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 5.h,
                            width: 5.h,
                            padding: EdgeInsets.only(
                                top: 1.h, left: 1.w, right: 1.w, bottom: 1.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white30),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(AppImages.notiIcon),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.signinoptioncolor, // Dark background
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.searchIcon,
                              height: 3.h,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText:
                                        'What event are you looking for...',
                                    hintStyle: TextStyles.searchtext,
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(2, 5, 2, 5)),
                              ),
                            ),
                            Image.asset(
                              AppImages.filterIcon,
                              height: 3.h,
                              color: AppColors.blueColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.featuretext,
                            style: TextStyles.regularhometext1,
                          ),
                          Text(
                            AppStrings.seealltext,
                            style: TextStyles.regularhometextblue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Container(
                      height: 45.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3, // show 3 shimmer cards while loading
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade700,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 25.h,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 40.w,
                                    height: 2.h,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 30.w,
                                    height: 1.5.h,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 50.w,
                                    height: 2.h,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
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
                    return Container(
                      height: 45.h,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
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
                              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                              width: 70.w,
                              padding: EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                color: AppColors.signinoptioncolor,
                                borderRadius: BorderRadius.circular(2.h),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2.h),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://eventgo-live.com/${event.eventImage}',
                                      width: 25.h,
                                      height: 25.h,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text('${event.eventTitle}', style: TextStyles.homeheadingtext),
                                  SizedBox(height: 1.h),
                                  Text(
                                    '${formatDate(event.startDate)}${formatDate(event.startTime)}',
                                    style: TextStyles.homedatetext,
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        AppImages.locIcon,
                                        color: AppColors.blueColor,
                                        height: 3.h,
                                      ),
                                      SizedBox(width: 2.w),
                                      Expanded(
                                        child: Text(
                                          '${event.address}${event.city}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.whiteColor,
                                            fontFamily: 'Montserrat',
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
                      ),
                    );
                  }
                }),

                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.populartext,
                            style: TextStyles.regularhometext1,
                          ),
                          Text(
                            AppStrings.seealltext,
                            style: TextStyles.regularhometextblue,
                          ),
                        ],
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          // Show shimmer while loading
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6, // show 6 shimmer items
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.w,
                              mainAxisSpacing: 2.h,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade700,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(2.h),
                                  ),
                                  padding: EdgeInsets.all(2.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 17.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(2.h),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Container(height: 2.h, width: 40.w, color: Colors.white),
                                      SizedBox(height: 1.h),
                                      Container(height: 1.5.h, width: 30.w, color: Colors.white),
                                      SizedBox(height: 1.h),
                                      Container(height: 2.h, width: 50.w, color: Colors.white),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
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
                          // Grid view with real event data
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.events.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.w,
                              mainAxisSpacing: 2.h,
                              childAspectRatio: 0.65,
                            ),
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
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.signinoptioncolor,
                                    borderRadius: BorderRadius.circular(2.h),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(2.h),
                                        child: CachedNetworkImage(
                                          imageUrl: 'https://eventgo-live.com/${event.eventImage}',
                                          height: 17.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Container(
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error, color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event.eventTitle ?? '',
                                            style: TextStyles.regularhometext2,
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            '${formatDate(event.startDate)} ${formatDate(event.startTime)}',
                                            style: TextStyles.regularhomedatetext,
                                          ),
                                          SizedBox(height: 1.h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                AppImages.locIcon,
                                                color: AppColors.blueColor,
                                                height: 2.h,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                                                  child: Text(
                                                    '${event.address ?? ''} ${event.city ?? ''}',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyles.regularlocatext,
                                                  ),
                                                ),
                                              ),
                                              Image.asset(
                                                AppImages.likeIcon,
                                                color: AppColors.blueColor,
                                                height: 2.h,
                                              ),
                                            ],
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
                      })


                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
