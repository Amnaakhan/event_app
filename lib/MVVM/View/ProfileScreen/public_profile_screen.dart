import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/MVVM/View/ProfileScreen/profile_tab/event_tab.dart';
import 'package:event_app/MVVM/View/ProfileScreen/profile_tab/review_tab.dart';
import 'package:event_app/MVVM/view_model/data_view_model.dart';
import 'package:event_app/MVVM/view_model/public_profile_controller.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'profile_screen.dart';

class PublicProfileScreen extends StatefulWidget {
  final int? id;

  const PublicProfileScreen({super.key, required this.id});

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> with TickerProviderStateMixin {
  late TabController _tabController;


  final List<Color> colors = [
    Color(0xFF817AFF),
    Color(0xFFFD5D5D),
    Color(0xFFFF9B57),
    Color(0xFF817AFF),
    Color(0xFF5BD7A1),
    Color(0xFF52D2FF),
  ];
  final PublicProfileController controller = Get.put(PublicProfileController());
  final dataViewModel = Get.put(DataViewModel());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadPublicProfile(widget.id);
    });
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);

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
      body: Obx((){

        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        } else if (controller.profile.value == null) {
          return Center(child: Text('No profile found'));
        }
        final profile = controller.profile.value!;
        final List<String>? interests = profile.interests;
        final rawInterests = profile.interests ?? [];
        final splitInterests = rawInterests.expand((e) => e.split(',')).toList();
        return
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
            child: Column(

              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text('Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp)),
                  ],
                ),
                SizedBox(height: 3.h,),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage:  CachedNetworkImageProvider(
                    'https://eventgo-live.com/${profile.profileImageUrl}',


                  ),
                ),
                // CachedNetworkImage(
                //   imageUrl:'https://eventgo-live.com/${profile.profileImageUrl}',
                //
                //   width: 14.h,
                //   height: 14.h,
                //   fit: BoxFit.cover, // You can also try BoxFit.contain for a more fitting size
                //   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),                   SizedBox(height: 3.h,),

                Text('${profile.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp)),
                SizedBox(height: 2.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('${profile.followingCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp)),
                        Text('Following',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ],
                    ),
                    Container(height: 5.h,width: 1,color: Color(0xffDDDDDD),),
                    Column(
                      children: [
                        Text('${profile.followersCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp)),
                        Text('Followers',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() {
                      final isFollowing = dataViewModel.isFollowing.value;
                      return InkWell(
                        onTap: () {
                          dataViewModel.toggleFollow(); // Pass correct user ID here
                        },
                        child: Container(
                          height: 7.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color:  AppColors.blueColor,
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(color: AppColors.blueColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/follow_icon.png',
                                height: 4.h,
                                color: Colors.white,
                              ),
                              Text(
                                isFollowing ? 'Unfollow' : 'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    InkWell(
                      onTap: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => NotificationScreen()),
                        // );
                      },
                      child: Container(
                        height: 7.h,width: 40.w,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(2.h),
                            border: Border.all(color: AppColors.blueColor)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/message.png',height: 4.h,),
                            Text('Massages',
                                style:TextStyle(
                                    color: AppColors.blueColor,
                                    fontSize: 12.sp)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('About Me',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp)),
                ),
                SizedBox(height: 2.h,),

                Container(
                  width: double.infinity,
                  child: Text('${profile.shortBio}', style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  )),
                ),
                SizedBox(height: 5.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Interest',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp)),
                ),
                SizedBox(height: 2.h,),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(splitInterests.length, (index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        splitInterests[index].trim(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: 2.h,),



              ],
            ),

          ),
        );}
      ),
    );
  }
}
