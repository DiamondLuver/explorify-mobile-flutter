import 'package:frontend_mobile/model/cv/user_model.dart';

class Otp {
  int? otpId;
  bool? isVerify;
  DateTime? expiryTime;
  String code;
  User? user;

  Otp({
    this.otpId,
    this.isVerify,
    this.expiryTime,
    this.user,
    required this.code,
  });
}
