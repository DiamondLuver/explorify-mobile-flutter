import 'package:frontend_mobile/model/cv/user_model.dart';

class Otp {
  int? otpId; // '?' indicates nullable variable
  bool? isVerify;
  DateTime? expiryTime;
  User user;

  Otp({
    this.otpId,
    this.isVerify,
    this.expiryTime,
    required this.user,
  });
}
