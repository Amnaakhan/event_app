import 'package:event_app/MVVM/view_model/public_profile_controller.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  final controller = Get.put(PublicProfileController());

  final List<String> interests = [
    'Games Online',
    'Concert',
    'Music',
    'Art',
    'Movie',
    'Others',
  ];

  final List<Color> colors = [
    Color(0xFF817AFF),
    Color(0xFFFD5D5D),
    Color(0xFFFF9B57),
    Color(0xFF817AFF),
    Color(0xFF5BD7A1),
    Color(0xFF52D2FF),
  ];
  final List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.error.isNotEmpty) {
        return Center(child: Text(controller.error.value));
      } else if (controller.userProfile.value == null) {
        return Center(child: Text('Profile not found'));
      }

      final profile = controller.userProfile.value!;
      final List<String>? interests = profile.data?.interests;
      final rawInterests = profile.data?.interests ?? [];
      final splitInterests = rawInterests.expand((e) => e.split(',')).toList();
      print('profile ${controller.userProfile}');
      return
        Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                  '${profile.data?.shortBio}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(height: 2.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Interest',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp)),
            ),
            SizedBox(
              height: 2.h,
            ),

            Wrap(
              spacing: 5,
              runSpacing: 8,
              children: List.generate(splitInterests.length, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.w, vertical: 1.h),
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
          ],
        );
    }
    );
  }
}
