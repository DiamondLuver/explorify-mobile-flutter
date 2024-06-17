class APIEndPoint {
  static final String baseUrl = 'http://localhost:8989/api';
  static final String version = '/v1';
  static _AuthEndPoint authEndPoint = _AuthEndPoint();
}

class _AuthEndPoint {
  final String register = "/account/create/";
  final String login = "/currentUser/";
  final String getCV = "/cv-form-data/";
}
