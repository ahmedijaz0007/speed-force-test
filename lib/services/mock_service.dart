import '../services/auth_service.dart';

class MockAuthApiService extends AuthApiService {
  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    if (email == 'user@speedforce.com' && password == 'password') {
      return {
        "status": "success",
        "message": "Login successful",
        "data": {
          "id": 5,
          "first_name": "David",
          "last_name": "Mathew",
          "email": "user@speedforce.com",
          "gender": "male",
          "phone": "0501234567",
          "avatar":
          "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "earnings": 9545,
          "role": "provider",
          "status": "active",
          "is_verified": "verified",
          "joined_at": "2024-08-28T12:01:09.000000Z",
          "ratings": "4.5",
          "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore."
        }
      };
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
