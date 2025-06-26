import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/MVVM/View/CreateAd/donation.dart';
import 'package:event_app/MVVM/view_model/ad_view_model.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../app/config/app_text_style.dart';

class ADsDetailScreen extends StatefulWidget {
  final int? adId;

  const ADsDetailScreen({super.key, required this.adId});

  @override
  State<ADsDetailScreen> createState() => _ADsDetailScreenState();
}

class _ADsDetailScreenState extends State<ADsDetailScreen> {
  final AdViewModel viewModel = Get.put(AdViewModel());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getAdDetail(widget.adId);
    });
    // viewModel.getAdDetail(widget.adId); // 🟢 Call only once here
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:
      Obx((){
        if (viewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.error.isNotEmpty) {
          return Center(child: Text(viewModel.error.value));
        }

        final ad = viewModel.adDetail.value.ad;


        if (ad == null) return const Center(child: Text('No data found.'));
        return
         Column(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://eventgo-live.com${ad.imageUrl}',
              height: 25.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${ad.title}', style: TextStyles.heading),
                        Text('\$${ad.amount}', style: TextStyles.heading),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text('About Ad', style: TextStyles.regularhometext1),
                    SizedBox(height: 1.h),
                    Text(
                      '${ad.description}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontFamily: 'Montserrat',
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    ButtonWidget(
                      text: 'Donate',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DonationScreen(donId: ad.donationId,),)
                        );
                      },
                      borderRadius: 4.h,
                      textColor: AppColors.whiteColor,
                      backgroundColor: AppColors.blueColor,
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ],
        );}
      ),
    );
  }


}
