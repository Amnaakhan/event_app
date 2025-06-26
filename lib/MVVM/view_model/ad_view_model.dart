import 'dart:io';
import 'package:event_app/MVVM/View/CreateAd/all_ads_screen.dart';
import 'package:event_app/MVVM/body_model/ads_model.dart';
import 'package:event_app/Services/ad_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../body_model/ad_detail_model.dart';

class AdViewModel extends GetxController {
  final AdService _adService = AdService();
  var ads = <AdsModel>[].obs;
  var adDetail = AdsDetailModel().obs;

  var error = ''.obs;

  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);
  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['refresh'] == true) {
      fetchAds(); // this should re-fetch the data
    }    super.onInit();
  }
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  Future<void> uploadAd({
    required String title,
    required String description,
    required String targetAmount,
  }) async {
    if (selectedImage.value == null) {
      Get.snackbar("Image Missing", "Please select an image.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _adService.addAd(
        title: title,
        description: description,
        targetAmount: targetAmount,
        imageFile: selectedImage.value!,
      );

      if (result['success']) {
        Get.snackbar("Success", "Ad uploaded successfully");
        Get.to(() => AllAdsScreen(), arguments: {'refresh': true});
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  void fetchAds() async {
    try {
      isLoading.value = true;
      ads.value = await _adService.fetchAds();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getAdDetail(int? adId) async {
    try {
      isLoading.value = true;
      final detail = await _adService.fetchAdDetail(adId);
      adDetail.value = detail;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
