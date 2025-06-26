// import 'package:event_app/app/config/app_colors.dart';
// import 'package:event_app/app/config/app_strings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../Widget/button_widget.dart';
// import '../../../app/config/app_asset.dart';
// import '../../../app/config/app_text_style.dart';
//
// class OnboardScreen3 extends StatelessWidget {
//   const OnboardScreen3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Padding(
//         padding: EdgeInsets.only(top: 9.h),
//         child: Column(
//           children: [
//             Padding(
//                 padding: EdgeInsets.only(left: 5.w,right: 5.w),
//                 child: Image.asset(AppImages.onboardImg3)),
//
//             Expanded(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//
//                   height: 38.h,
//                   width: double.infinity,
//                   padding: EdgeInsets.only(top: 2.h,left: 5.w,right: 5.w),
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(4.h),
//                           topRight: Radius.circular(4.h) )
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         AppStrings.onboardText3,
//                         textAlign: TextAlign.center,
//                         style: TextStyles.heading,),
//                       SizedBox(height: 2.h,),
//                       Text(
//                         AppStrings.onboardText2,
//                         textAlign: TextAlign.center,
//                         style: TextStyles.regularhometext,),
//                       SizedBox(height: 2.h,),
//                       Image.asset(AppImages.dot2),
//                       SizedBox(height: 2.h,),
//
//                       ButtonWidget(text: 'Get Started', onPressed: () {  },backgroundColor: AppColors.blueColor,borderRadius: 4.h,)
//
//                     ],
//                   ),
//
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Widget/button_widget.dart';
import '../../../app/config/app_asset.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/config/app_pages.dart';
import '../../../app/config/app_strings.dart';
import '../../../app/config/app_text_style.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardData = [
    {
      "image": AppImages.onboardImg1,
      "title": AppStrings.onboardText1,
    },
    {
      "image": AppImages.onboardImg2,
      "title": AppStrings.onboardText4,
    },
    {
      "image": AppImages.onboardImg3,
      "title": AppStrings.onboardText3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: 7.h),
        child: Stack(
          children: [
            /// PageView
            Positioned.fill(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: onboardData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboardData[index]["image"]!,
                  title: onboardData[index]["title"]!,
                ),
              ),
            ),

            /// Dots Indicator - Placed Below the Text
            Positioned(
              bottom: 15.h, // Adjust position
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: onboardData.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.blueColor,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),

            /// Button - Positioned at the Bottom
            Positioned(
              bottom: 5.h, // Adjust as needed
              left: 5.w,
              right: 5.w,
              child: ButtonWidget(
                text: currentIndex == onboardData.length - 1 ? "Get Started" : "Next",
                onPressed: () {
                  if (currentIndex == onboardData.length - 1) {
                    Navigator.pushReplacementNamed(context, RouteName.loginScreen);
                  } else {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
                backgroundColor: AppColors.blueColor,
                borderRadius: 4.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image, title;

  const OnboardingContent({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Image.asset(image),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.h),
                  topRight: Radius.circular(4.h),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.subheading,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.onboardText2,
                    textAlign: TextAlign.center,
                    style: TextStyles.regularhometext,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
