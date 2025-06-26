import 'package:event_app/MVVM/body_model/profile_model.dart';
import 'package:get/get.dart';

import '../../Services/profile_service.dart';
import '../body_model/ViewProfileModel.dart';

class PublicProfileController extends GetxController {
  final Rxn<ViewPublicProfileModel> profile = Rxn<ViewPublicProfileModel>();
  var userProfile = Rxn<ProfileModel>();

  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;


  @override
  void onInit() {
    // loadPublicProfile();
    fetchUserProfile();
    super.onInit();
  }
  final UserService _userService = UserService();

  Future<void> loadPublicProfile(int? id) async {
    try {
      isLoading.value = true;
      final result = await _userService.fetchPublicProfile(id);
      if (result != null) {
        profile.value = result;
        error.value = '';
      } else {
        error.value = 'Failed to load profile';
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  void fetchUserProfile() async {
    try {
      isLoading.value = true;
      final profile = await _userService.fetchProfile();
      userProfile.value = profile;
      print('Name: ${profile.data?.name}');
      print('Bio: ${profile.data?.shortBio}');
      print('Interests: ${profile.data?.interests}');
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
