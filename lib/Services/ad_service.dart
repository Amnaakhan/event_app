import 'dart:convert';
import 'dart:io';
import 'package:event_app/MVVM/body_model/ads_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MVVM/body_model/ad_detail_model.dart';

class AdService {
  final String baseUrl = "https://eventgo-live.com/api/v1";

  Future<Map<String, dynamic>> addAd({
    required String title,
    required String description,
    required String targetAmount,
    required File imageFile,
  }) async {
    final uri = Uri.parse('$baseUrl/ads/add');
    final request = http.MultipartRequest('POST', uri);
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token', // if required
    });
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['target_amount'] = targetAmount;

    request.files.add(await http.MultipartFile.fromPath(
      'imageUrl',
      imageFile.path,
      contentType: MediaType('image', 'jpeg'), // or png
    ));

    final response = await request.send();
    final res = await http.Response.fromStream(response);

    if (res.statusCode == 200) {
      return {
        'success': true,
        'body': res.body,
      };
    } else {
      throw Exception("Failed to upload ad: ${res.body}");
    }
  }
  Future<List<AdsModel>> fetchAds() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    final response = await http.get(

      Uri.parse("$baseUrl/ads"),
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token', // if required

    },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => AdsModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch ads");
    }
  }
  Future<Map<String, dynamic>> fetchAdDetails(int adId) async {
    final response = await http.get(Uri.parse('$baseUrl/ads/$adId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch ad details');
    }
  }
  Future<AdsDetailModel> fetchAdDetail(int? adId) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token ${token}');
    final response = await http.get(
      Uri.parse('$baseUrl/ads/$adId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // if required


      },
    );

    if (response.statusCode == 200) {
      return AdsDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load ad detail');
    }
  }
}
