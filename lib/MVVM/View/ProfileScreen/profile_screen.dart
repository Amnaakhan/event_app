
import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/MVVM/View/AccountSetup/account_setup_screnn.dart';
import 'package:event_app/MVVM/View/ProfileScreen/profile_tab/about_tab.dart';
import 'package:event_app/MVVM/View/ProfileScreen/profile_tab/event_tab.dart';
import 'package:event_app/MVVM/View/ProfileScreen/profile_tab/review_tab.dart';
import 'package:event_app/MVVM/view_model/data_view_model.dart';
import 'package:event_app/MVVM/view_model/public_profile_controller.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../bottombar/bottom_navigation_bar.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {

  int _activeIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);

  }
  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }
  final controller = Get.put(PublicProfileController());

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx((){
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        } else if (controller.userProfile.value == null) {
          return Center(child: Text('Profile not found'));
        }

        final profile = controller.userProfile.value!;
        print('profile ${controller.userProfile}');
        return
        SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const BottomNavBar()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(height: 3.h,),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage:  CachedNetworkImageProvider(
                    'https://eventgo-live.com/${profile.data?.profileImageUrl}',


                  ),
                ),
                // CachedNetworkImage(
                //   imageUrl:'https://eventgo-live.com/${profile.data?.profileImageUrl}',
                //
                //   width: 14.h,
                //   height: 14.h,
                //   fit: BoxFit.cover, // You can also try BoxFit.contain for a more fitting size
                //   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
                SizedBox(height: 3.h,),

                Text('${profile.data?.name}',
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
                        Text('${profile.data?.followingCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp)),
                        Text('Following',
                            style: TextStyle(
                                color:AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                      ],
                    ),
                    Container(height: 5.h,width: 1,color: Color(0xffDDDDDD),),
                    Column(
                      children: [
                        Text('${profile.data?.followersCount}',
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

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountSetupScreen()),
                    );
                  },
                  child: Container(
                    height: 8.h,width: 50.w,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(2.h),
                        border: Border.all(color: AppColors.blueColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/edit_icon.png',height: 4.h,),
                        Text('Edit Profile',
                            style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 12.sp)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h,),

                Container(
                  height: 5.h,
                  width: double.infinity,
                  // color: Colors.purple,

                  child:Column(
                    children: [
                      Expanded( child:
                      TabBar(
                        controller: _tabController,

                        indicatorColor: AppColors.blueColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        padding: EdgeInsets.only(bottom: 1.h),
                        labelColor: Colors.white,
                        labelPadding: EdgeInsets.only(left: 1.w, right: 2.w),
                        dividerColor: Colors.transparent,

                        labelStyle:
                        TextStyle(color: Colors.white, fontSize: 15.sp), tabs: [
                        Tab(
                            child:
                            _activeIndex== 0?
                            Text('About',style:  TextStyle(color: AppColors.blueColor,
                                 fontSize: 13.sp),):
                            Text('About',style:  TextStyle(color: AppColors.whiteColor, fontSize: 13.sp))

                        ),
                        Tab(
                            child:
                            _activeIndex== 1?
                            Text('Events',style:  TextStyle(color: AppColors.blueColor, fontSize: 13.sp),):
                            Text('Events',style:  TextStyle(color: AppColors.whiteColor, fontSize: 13.sp))

                        ),
                        Tab(
                            child:
                            _activeIndex== 2?
                            Text('Reviews',style:  TextStyle(color: AppColors.blueColor, fontSize: 13.sp),):
                            Text('Reviews',style:  TextStyle(color: AppColors.whiteColor, fontSize: 13.sp))

                        ),
                      ],)),
                    ],
                  ) ,
                ),
                SizedBox(height: 2.h,),

                Container(height: 40.h,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AboutTab(),
                      EventTab(),
                      ReviewTab(),


                    ],
                  ),
                )

              ],
            ),
          ),
        );}
      ),
    );
  }
}
