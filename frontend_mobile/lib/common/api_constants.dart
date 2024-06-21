class APIEndPoint {
  static final String baseUrl = 'http://10.0.2.2:8989/api';
  static final String version = '/v1';
  static _AuthEndPoint authEndPoint = _AuthEndPoint();
}

class _AuthEndPoint {
  final String register = "/account/create/";
  final String login = "/account/generate/";
  final String getToken = "/account/login_with_otp/";
  final String getCV = "/cv-form-data/";
}
