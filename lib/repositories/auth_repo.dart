
import '../models/login_model.dart';
import '../services/auth_service.dart';

class AuthRepository {
  final AuthApiService _apiService;

  AuthRepository(this._apiService);

  Future<Login> login(String email, String password) async {
    final rawResponse = await _apiService.login(email, password);
    return Login.fromJson(rawResponse);
  }
}
