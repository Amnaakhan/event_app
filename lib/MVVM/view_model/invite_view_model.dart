import 'package:event_app/MVVM/View/bottombar/bottom_navigation_bar.dart';
import 'package:event_app/Services/invite_service.dart';
import 'package:get/get.dart';

class InviteViewModel extends GetxController {
  final InviteService _inviteService = InviteService();

  var isLoading = false.obs;
  var responseMessage = ''.obs;
  var selectedUserIds = <int>[].obs;

  void toggleInvite(int userId) {
    if (selectedUserIds.contains(userId)) {
      Get.snackbar("Already Invited", "You already invited this user.");
    } else {
      selectedUserIds.add(userId);
    }
  }

  Future<void> sendInvites() async {
    if (selectedUserIds.isEmpty) {
      Get.snackbar("No Users", "Please select at least one user to invite.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _inviteService.inviteUsers(userIds: selectedUserIds, );
      responseMessage.value = "Invitations sent successfully.";
      print(result["results"]);
      Get.snackbar("Success", responseMessage.value);
      Get.to(BottomNavBar());
    } catch (e) {
      responseMessage.value = "Failed to send invitations.";
      print("Error: $e");
      Get.snackbar("Error", responseMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
