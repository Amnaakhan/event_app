import 'package:event_app/MVVM/View/bookEvent/book_event_screen.dart';
import 'package:event_app/MVVM/view_model/event_view_model.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:event_app/app/config/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Widget/button_widget.dart';
import '../../../app/config/app_strings.dart';
import '../UsersData/invite_user_list.dart';
import '../bottombar/bottom_navigation_bar.dart';

class EventDetailScreen extends StatefulWidget {
  final String eventId;

   EventDetailScreen({ required this.eventId});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final controller = Get.put(EventController());

  final PageController _controller = PageController();

  final List<String> images = [
    AppImages.img,
    AppImages.img,
    AppImages.img,
    AppImages.img,
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.EventDetail(widget.eventId);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('iddd ${widget.eventId} ');
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final event = controller.eventDetail.value;
        if (event == null) return const Center(child: Text('No event found'));

        return Stack(
          children: [
            // Scrollable content
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: 10.h), // Add bottom space for the button
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carousel + dots
                    Container(
                      height: 40.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          PageView.builder(
                            controller: _controller,
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Image.asset(
                                    images[index],
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                  Positioned(
                                    top: 5.h,
                                    left: 2.w,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                const BottomNavBar()),
                                          );
                                        },
                                        child: Icon(Icons.arrow_back,
                                            color: AppColors.whiteColor)),
                                  ),
                                  Positioned(
                                    top: 5.h,
                                    right: 14.w,
                                    child: Image.asset(AppImages.likeIcon,
                                        color: Colors.white, height: 3.5.h),
                                  ),
                                  Positioned(
                                    top: 5.h,
                                    right: 3.w,
                                    child: Image.asset(AppImages.shareIcon,
                                        height: 3.h),
                                  ),
                                ],
                              );
                            },
                          ),
                          Positioned(
                            top: 37.h,
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: images.length,
                              effect: WormEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                spacing: 5,
                                activeDotColor: AppColors.blueColor,
                                dotColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Scrollable content continued
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('${event.eventTitle}',
                                  style: TextStyles.heading),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) =>
                                    InviteUserList()),

                                  );
                                },
                                child: Container(
                                  height: 4.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.h),
                                    border:
                                    Border.all(color: AppColors.blueColor),
                                  ),
                                  child: Center(
                                    child: Text('Invite',
                                        style: TextStyles.regularhometextblue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 7.h,
                            child: Row(
                              children: [
                                Container(
                                  height: 4.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.h),
                                    border:
                                    Border.all(color: AppColors.blueColor),
                                  ),
                                  child: Center(
                                    child: Text('Music',
                                        style: TextStyles.regularhometextblue),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                OverlapAvatar(
                                  insideRadius: 18,
                                  outSideRadius: 18,
                                  widthFactor: 0.5,
                                  backgroundImage:
                                  AssetImage('assets/images/circle1.png'),
                                  itemCount: 4,
                                  groupWidth: 25.w,
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(width: 2.w),
                                Text('20,000 + Going',
                                    style: TextStyles.buttontext),
                                SizedBox(width: 1.w),
                                Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey, thickness: 0.5),
                          SizedBox(height: 1.h,),
                          Row(
                            children: [
                              Container(
                                height: 7.h,
                                width: 7.h,
                                decoration: BoxDecoration(
                                    color: Color(0xff1D1E32),
                                    shape: BoxShape.circle

                                ),
                                child: Center(
                                  child: Icon(Icons.calendar_month,
                                    color: AppColors.blueColor,),
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${formatDate(event.startDate)}',
                                      style: TextStyles.regularhometext1),
                                  SizedBox(height: 1.h,),

                                  Text('${formatTime(event.startTime)} - ${formatTime(event.endTime)}(GMt +7:00)',
                                      style: TextStyles.regularhometext),
                                  SizedBox(height: 1.h,),

                                  Container(
                                    height: 4.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.blueColor,

                                      borderRadius: BorderRadiusDirectional.all(
                                          Radius.circular(40)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,

                                      children: [

                                        Icon(Icons.calendar_month,
                                          color: Colors.white, size: 15,),
                                        SizedBox(width: 2.w,),
                                        Text("Add to My Calender",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 10.sp),),


                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Row(
                            children: [
                              Container(
                                height: 7.h,
                                width: 7.h,
                                decoration: BoxDecoration(
                                    color: Color(0xff1D1E32),
                                    shape: BoxShape.circle

                                ),
                                child: Center(
                                  child: Icon(Icons.location_pin,
                                    color: AppColors.blueColor,),
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${event.address}',
                                      style: TextStyles.regularhometext1),
                                  SizedBox(height: 1.h,),

                                  Text('${event.address},${event.city}',
                                      style: TextStyles.regularhometext),
                                  SizedBox(height: 1.h,),

                                  Container(
                                    height: 4.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.blueColor,

                                      borderRadius: BorderRadiusDirectional.all(
                                          Radius.circular(40)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,

                                      children: [

                                        Icon(Icons.location_pin,
                                          color: Colors.white, size: 15,),
                                        SizedBox(width: 2.w,),
                                        Text("see Location on Map",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 10.sp),),


                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Row(
                            children: [
                              Container(
                                height: 7.h,
                                width: 7.h,
                                padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                decoration: BoxDecoration(
                                    color: Color(0xff1D1E32),
                                    shape: BoxShape.circle

                                ),
                                child: Center(
                                  child: Image.asset(AppImages.ticketfilledIcon,
                                    color: AppColors.blueColor,),
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text('${event.eventPrice}',
                                      style: TextStyles.regularhometext1),
                                  SizedBox(height: 1.h,),

                                  Text('Ticket Price Depend on Pacakge',
                                      style: TextStyles.regularhometext),
                                  SizedBox(height: 1.h,),


                                ],
                              )
                            ],
                          ),
                          Divider(color: Colors.grey, thickness: 0.5),
                          Text('About Event',
                              style: TextStyles.regularhometext1),
                          SizedBox(height: 2.h,),

                          Text(
                            '${event.description}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',

                              height: 1.5,
                            ),

                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     // action on tap
                          //     debugPrint('');
                          //   },
                          //   child: const Text(
                          //     'Read more...',
                          //     style: TextStyle(
                          //       color: AppColors.blueColor, // Blue link color
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),

                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('More Events Like this',
                                  style: TextStyles.regularhometext1),
                              Text(AppStrings.seealltext,
                                  style: TextStyles.regularhometextblue),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Container(
                            height: 45.h,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      top: 1.h,
                                      left: 3.w,
                                      right: 3.w,
                                      bottom: 1.h),
                                  height: 10.h,
                                  width: 70.w,
                                  padding: EdgeInsets.all(2.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.signinoptioncolor,
                                    borderRadius: BorderRadius.circular(2.h),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            2.h),
                                        child: Image.asset(AppImages.img),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(AppStrings.festext,
                                          style: TextStyles.homeheadingtext),
                                      SizedBox(height: 1.h),
                                      Text(AppStrings.datetext,
                                          style: TextStyles.homedatetext),
                                      SizedBox(height: 1.h),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(AppImages.locIcon,
                                              color: AppColors.blueColor,
                                              height: 3.h),
                                          Text(AppStrings.locationtext,
                                              style: TextStyles
                                                  .regularhometext),
                                          Image.asset(AppImages.likeIcon,
                                              color: AppColors.blueColor,
                                              height: 3.h),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Fixed Book Button
            Positioned(
              bottom: 2.h,
              left: 5.w,
              right: 5.w,
              child: ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>
                        BookEventScreen(id: event.eventId,)),

                  );
                  print('event id ${event.eventId}');
                },
                text: 'Book Event',
                backgroundColor: AppColors.blueColor,
                borderRadius: 4.h,
              ),
            ),
          ],
        );
      }
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
