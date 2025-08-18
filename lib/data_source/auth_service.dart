import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  String? userId; // Store token/user_id here

  Future<bool> login(String email, String password) async {
    final url =
        Uri.parse('https://app-backend-jhpm.onrender.com/api/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      userId = data['user_id']; // or data['token'] when available
      return true;
    }

    return false;
  }
}
