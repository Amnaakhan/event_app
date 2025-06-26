import 'dart:convert';
import 'dart:io';

import 'package:event_app/MVVM/body_model/event_detail_model.dart';
import 'package:event_app/MVVM/body_model/event_model.dart';
import 'package:event_app/MVVM/body_model/my_event_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventService {
  Future<http.Response> createEvent({
    required String eventTitle,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required String eventPrice,
    required String eventdes,
    required String eventcategory,
    required String eventaddress,
    required String eventcity,
    required String eventlatitude,
    required String eventlogitude,
    required String eventimage, // File path of the image
  }) async {
    var uri = Uri.parse('https://eventgo-live.com/api/v1/events');
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token', // if required
    });
    // Fields
    request.fields['eventTitle'] = eventTitle;
    request.fields['startDate'] = startDate;
    request.fields['endDate'] = endDate;
    request.fields['startTime'] = startTime;
    request.fields['endTime'] = endTime;
    request.fields['eventPrice'] = eventPrice;
    request.fields['description'] = eventdes;
    request.fields['category'] = eventcategory;
    request.fields['address'] = eventaddress;
    request.fields['city'] = eventcity;
    request.fields['latitude'] = eventlatitude;
    request.fields['longitude'] = eventlogitude;

    // File
    if (eventimage.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'eventImage',
        eventimage,
        filename: basename(eventimage),
      ));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }


  static const String baseUrl = "https://eventgo-live.com/api/v1/events";


  Future<List<EventModel>> fetchEvents() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print('token ${token}');

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);

        if (body['success'] == true && body['data'] != null) {
          final List<dynamic> data = body['data'];
          return data.map((e) => EventModel.fromJson(e)).toList();
        } else {
          throw Exception(body['message'] ?? "API Error");
        }
      } else {
        throw Exception('Failed to load events. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  Future<EventDetailModel> fetchEventDetail(String id) async {
    final url = Uri.parse('https://eventgo-live.com/api/v1/events/$id');
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('responce ${response.body}');
      return EventDetailModel.fromJson(data);
    } else {
      throw Exception('Failed to load event details');
    }
  }


  Future<List<MyEventModel>> fetchMyEvents() async {
    final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print('token ${token}');
    final response = await http.get(
      Uri.parse('https://eventgo-live.com/api/v1/events/my'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => MyEventModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load your events");
    }
  }

  Future<http.Response> deleteEvent(String id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    final url = Uri.parse('https://eventgo-live.com/api/v1/events/$id');
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    return response;
  }
  Future<http.Response> updateEvent({
    required String eventId,
    required String eventTitle,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required String eventPrice,
    required String eventdes,
    required String eventcategory,
    required String eventaddress,
    required String eventcity,
    required String eventlatitude,
    required String eventlogitude,
    File? eventImage, // Optional
  }) async {
    final uri = Uri.parse("https://eventgo-live.com/api/v1/events/$eventId");

    var request = http.MultipartRequest("POST", uri);

    // Add headers
    request.headers['Authorization'] = 'Bearer ';

    // Add fields
    request.fields['eventTitle'] = eventTitle;
    request.fields['startDate'] = startDate;
    request.fields['endDate'] = endDate;
    request.fields['startTime'] = startTime;
    request.fields['endTime'] = endTime;
    request.fields['eventPrice'] = eventPrice;
    request.fields['description'] = eventdes;
    request.fields['category'] = eventcategory;
    request.fields['address'] = eventaddress;
    request.fields['city'] = eventcity;
    request.fields['latitude'] = eventlatitude;
    request.fields['longitude'] = eventlogitude;

    // Optional file
    if (eventImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'eventImage',
        eventImage.path,
        filename: basename(eventImage.path),
      ));
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    return response;
  }
}
