import '../constants/app_constants.dart';
import '../network/base_api.dart';
import 'dart:convert';

class AuthApiService extends BaseApiService {
  /// Handles user login by sending a POST request with email and password.
  /// Returns a `Map<String, dynamic>` containing the response data.
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to login: ${response.statusCode}');
      }

      final responseBody = jsonDecode(response.body);
      if (responseBody == null) {
        throw Exception('Invalid response format');
      }

      if (responseBody.containsKey('error')) {
        throw Exception('Error: ${responseBody['error']}');
      }

      // Return the parsed response
      return responseBody;
    } catch (e) {
      // Log the error for debugging purposes
      print('Login Error: $e');
      rethrow; // Re-throw the exception to handle it further up the chain
    }
  }
}
