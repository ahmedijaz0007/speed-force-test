import '../models/login_model.dart';
import '../services/mock_service.dart';

class AuthRepository {
  final MockAuthApiService _apiService;

  AuthRepository(this._apiService);

  Future<Login> login(String email, String password) async {
    try {
      final rawResponse = await _apiService.login(email, password);

      return Login.fromJson(rawResponse);
    }
    catch(e){
      print("Error In Api: e");
      rethrow;
    }
  }
}
