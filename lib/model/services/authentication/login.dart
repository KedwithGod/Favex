

import 'package:dio/dio.dart';
import 'package:favex/model/models/authentication/login.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000/api/v1')); 
  // adjust baseUrl for emulator/device

  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("Login failed: ${e.response?.data}");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    }
  }
}
