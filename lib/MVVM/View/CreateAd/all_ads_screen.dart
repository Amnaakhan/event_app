import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_app/MVVM/View/CreateAd/ads_detail_screen.dart';
import 'package:event_app/MVVM/view_model/ad_view_model.dart';
import 'package:event_app/app/config/app_asset.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../app/config/app_text_style.dart';
import '../bottombar/bottom_navigation_bar.dart';

class AllAdsScreen extends StatefulWidget {
  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  final adVM = Get.put(AdViewModel());

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
                Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Ads",
                  style: TextStyles.tickettext,
                ),

              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child:
              Obx(() {
                if (adVM.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (adVM.error.isNotEmpty) {
                  return Center(child: Text(adVM.error.value));
                } else if (adVM.ads.isEmpty) {
                  return Center(child: Text('No events available'));
                } else {
                  return
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: adVM.ads.length,
                      itemBuilder: (context, index) {
                        final ads = adVM.ads[index];
                        return InkWell(

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => ADsDetailScreen(adId: ads.donationId)),
                              );

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
                                      // Image.asset('',
                                      //     width: 13.h,
                                      //     height: 13.h,
                                      //     fit: BoxFit.cover),
                                      CachedNetworkImage(
                                        imageUrl: 'https://eventgo-live.com/${ads.imageUrl}',
                                        width: 14.h,
                                        height: 14.h,
                                        fit: BoxFit.cover,
                                        // You can also try BoxFit.contain for a more fitting size
                                        placeholder: (context, url) =>
                                        const Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url,
                                            error) => const Icon(Icons.error),
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
                                            Text('${ads.title}',
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight
                                                        .bold)),
                                            SizedBox(height: 1.h),
                                            Text(
                                              'Description: ${ads.description!.length > 40 ?
                                              ads.description!.substring(0, 40) + '...' : ads.description}',
                                              style: const TextStyle(
                                                color: AppColors.blueColor,
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(height: 1.h),

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

}
