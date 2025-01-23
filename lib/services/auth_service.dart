import '../constants/app_constants.dart';
import '../network/base_api.dart';

class AuthApiService extends BaseApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    return await post(
      ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );
  }
}
