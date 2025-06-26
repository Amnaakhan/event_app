import 'dart:convert';
import 'dart:io';
import 'package:event_app/MVVM/body_model/event_detail_model.dart';
import 'package:event_app/MVVM/body_model/event_model.dart';
import 'package:event_app/MVVM/body_model/my_event_model.dart';
import 'package:event_app/Services/event_service.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  final EventService _eventService = EventService();
  var events = <EventModel>[].obs;
  var myEvents = <MyEventModel>[].obs;
  final RxString error = ''.obs;
  RxBool isDeleting = false.obs;
  var errorMessage = ''.obs;

  var eventDetail = Rxn<EventDetailModel>();

  // State
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchAllEvents();
    getMyEvents();
    super.onInit();
  }


  // Call this method to create the event
  Future<void> createEvent({
    required String eventTitle,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required String eventPrice,
    required String eventDescription,
    required String eventCategory,
    required String eventAddress,
    required String eventCity,
    required String eventLatitude,
    required String eventLongitude,
    required File eventImage,
  }) async {
    try {
      isLoading.value = true;

      final response = await _eventService.createEvent(
        eventTitle: eventTitle,
        startDate: startDate,
        endDate: endDate,
        startTime: startTime,
        endTime: endTime,
        eventPrice: eventPrice,
        eventdes: eventDescription,
        eventcategory: eventCategory,
        eventaddress: eventAddress,
        eventcity: eventCity,
        eventlatitude: eventLatitude,
        eventlogitude: eventLongitude,
        eventimage: eventImage.path,
      );

      if (response.statusCode == 200) {
        final data = response.body;
        print("${data}");
        // You can decode JSON here if needed
        Get.snackbar("Success", "Event created successfully.");
        // Navigate or update UI if needed
      } else {
        Get.snackbar("Error", "Failed to create event: ${response.body}");
        print("Error ${response.body}");

      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
      print("Error ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
  void fetchAllEvents() async {
    try {
      isLoading.value = true;
      final result = await _eventService.fetchEvents();
      events.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }  Future<void> EventDetail(String eventId) async {
    try {
      isLoading.value = true;
      final detail = await _eventService.fetchEventDetail(eventId);
      eventDetail.value = detail;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print('Error ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getMyEvents() async {
    try {
      isLoading.value = true;
      error.value = '';
      final events = await _eventService.fetchMyEvents();
      myEvents.assignAll(events);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> deleteEvent(String eventId) async {
    isDeleting.value = true;
    try {
      final response = await _eventService.deleteEvent(eventId);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Event deleted successfully",
            backgroundColor: AppColors.blueColor, colorText: AppColors.whiteColor
        );
        // Optionally refresh list or go back
        Get.back();
      } else {
        Get.snackbar("Error", "Failed to delete event: ${response.body}",
            backgroundColor: AppColors.blueColor, colorText: AppColors.whiteColor
        );
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(),
          backgroundColor: AppColors.blueColor, colorText: AppColors.whiteColor
      );
    } finally {
      isDeleting.value = false;
    }
  }
  Future<void> updateEvent({
    required String id,
    required String eventTitle,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required String eventPrice,
    required String description,
    required String category,
    required String address,
    required String city,
    required String latitude,
    required String longitude,
   required File? image,
  }) async {
    try {
      isLoading.value = true;

      final response = await _eventService.updateEvent(
        eventId: id,
        eventTitle: eventTitle,
        startDate: startDate,
        endDate: endDate,
        startTime: startTime,
        endTime: endTime,
        eventPrice: eventPrice,
        eventdes: description,
        eventcategory: category,
        eventaddress: address,
        eventcity: city,
        eventlatitude: latitude,
        eventlogitude: longitude,
        eventImage: image,
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Success", data["message"] ?? "Event updated.");
      } else {
        Get.snackbar("Error", data["error"] ?? "Update failed.");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

