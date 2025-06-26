import 'dart:convert';
import 'package:event_app/MVVM/body_model/ViewProfileModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../MVVM/body_model/profile_model.dart';

class UserService {
  static const String baseUrl = 'https://eventgo-live.com/api/v1';

  Future<ViewPublicProfileModel?> fetchPublicProfile(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    final uri = Uri.parse('$baseUrl/user/$id');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ViewPublicProfileModel.fromJson(json.decode(response.body));
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  }

  Future<ProfileModel> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    final uri = Uri.parse('$baseUrl/user');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('response $jsonResponse');

      return ProfileModel.fromJson(jsonResponse); // ✅ FIXED: Pass entire JSON response
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
