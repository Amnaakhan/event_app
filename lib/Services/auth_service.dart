import 'dart:convert';
import 'package:event_app/MVVM/body_model/user_list_model.dart';
import 'package:http/http.dart' as http;


class AuthService {
  static const String baseUrl = "https://eventgo-live.com/api/v1";


  static Future<Map<String, dynamic>> loginUser(
      String email, String password, bool rememberMe) async {
    var url = Uri.parse('https://eventgo-live.com/api/v1/login');

    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
        'remember_me': rememberMe.toString(),
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message'] ?? 'Something went wrong');
    }
  }


  static Future<Map<String, dynamic>> registerUser(
      String name, String email, String password, String confirmPassword) async {
    var url = Uri.parse('https://eventgo-live.com/api/v1/register');

    var response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );

    var decodedResponse = jsonDecode(response.body);

    // Attach statusCode to response
    decodedResponse['statusCode'] = response.statusCode;

    return decodedResponse;
  }

  static Future<Map<String, dynamic>> verifyEmail({
    required String? email,
    required String verificationCode,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/verify-email"),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "email": email,
        "verificationCode": verificationCode,
      },
    );

    print("Verify Email Status: ${response.statusCode}");
    print("Verify Email Response: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Verification failed: ${response.body}");
    }
  }
  static Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/forgot-password"),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "email": email,
      },
    );

    print("Forgot Password Status: ${response.statusCode}");
    print("Forgot Password Response: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Forgot password failed: ${response.body}");
    }
  }


  static Future<Map<String, dynamic>> verifyPasswordOtp({
    required String? email,
    required String otp,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/verify-password-otp"),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "email": email,
        "otp": otp,
      },
    );

    print("Verify OTP Status: ${response.statusCode}");
    print("Verify OTP Response: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("OTP verification failed: ${response.body}");
    }
  }

  static Future<Map<String, dynamic>> resetPassword({
    required String? email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/reset-password"),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },
    );

    print("Reset Password Status: ${response.statusCode}");
    print("Reset Password Response: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Reset password failed: ${response.body}");
    }
  }


  Future<UserListModel> fetchUsers() async {
    final uri = Uri.parse('$baseUrl/fetchusers');
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer 74|mWh1ROs3vEBr40YisB4NKtDL209NtwsiODK1nceS2c341fe3',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return UserListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}


