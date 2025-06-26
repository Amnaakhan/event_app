import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InviteService {
  final String baseUrl = "https://eventgo-live.com/api/v1";

  Future<Map<String, dynamic>> inviteUsers({
    required List<int> userIds,

  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userid = prefs.getString('userid');

    print('token ${token}');
    print('id=== ${userid}');

    final uri = Uri.parse('$baseUrl/invite/$userid');
print('${uri}');
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json', // ✅ Add this line

      },
      body: json.encode({"userIds": userIds}),
    );
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 200) {

      return json.decode(response.body);
    } else {
      throw Exception('Failed: ${response.body}');
    }
  }
}
