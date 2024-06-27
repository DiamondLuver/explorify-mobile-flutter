import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8989/api/v1/'));
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  String? _otp;
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _secureStorage.write(key: 'access_token', value: accessToken);
    await _secureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'refresh_token');
  }

  Future<void> refreshTokens() async {
    String? refreshToken = await _secureStorage.read(key: 'refresh_token');
    if (refreshToken == null) {
      throw Exception('No refresh token found');
    }

    try {
      final response = await _dio
          .post('account/generate/', data: {'refresh_token': refreshToken});
      if (response.statusCode == 200) {
        String newAccessToken = response.data['access_token'];
        String newRefreshToken = response.data['refresh_token'];
        await saveTokens(newAccessToken, newRefreshToken);
      } else {
        throw Exception('Failed to refresh tokens');
      }
    } catch (e) {
      throw Exception('Failed to refresh tokens: $e');
    }
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: 'access_token');
    await _secureStorage.delete(key: 'refresh_token');
  }

  Future<void> login(String username, String password) async {
    try {
      final response = await _dio.post('account/generate/', data: {
        'username_or_email': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        // Assuming the response contains an OTP or similar challenge
        // Handle OTP verification separately
        _otp =(response.data['body']['code']);
        // print(response.data['body']['code']);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<void> verifyOTP(String username, String otp) async {
    try {
      final response = await _dio.post('account/login_with_otp/', data: {
        'username_or_email': username,
        'code': otp,
      });
      if (response.statusCode == 200) {
        String accessToken = response.data['access_token'];
        String refreshToken = response.data['refresh_token'];
        await saveTokens(accessToken, refreshToken);
        print(accessToken);
      } else {
        throw Exception('Failed to verify OTP');
      }
    } catch (e) {
      throw Exception('Failed to verify OTP: $e');
    }
  }
}
