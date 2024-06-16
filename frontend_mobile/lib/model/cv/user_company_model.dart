import 'dart:convert';

import 'package:frontend_mobile/model/cv/user_model.dart';
import 'package:frontend_mobile/model/internship/company_profile.dart';

// Assuming you have models for User and CompanyProfile

class UserCompany {
  final int userCompanyId;
  final User user;
  final CompanyProfile company;
  final DateTime startDate;
  final DateTime endDate;

  UserCompany({
    required this.userCompanyId,
    required this.user,
    required this.company,
    required this.startDate,
    required this.endDate,
  });
  UserCompany copyWith({
    int? userCompanyId,
    User? user,
    CompanyProfile? company,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return UserCompany(
      userCompanyId: userCompanyId ?? this.userCompanyId,
      user: user ?? this.user,
      company: company ?? this.company,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  factory UserCompany.fromMap(Map<String, dynamic> map) {
    return UserCompany(
      userCompanyId: map['user_company_id'] as int,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      company: CompanyProfile.fromMap(map['company'] as Map<String, dynamic>),
      startDate: DateTime.parse(map['start_date'] as String),
      endDate: DateTime.parse(map['end_date'] as String),
    );
  }
  Map<String, dynamic> toMap() => {
        'user_company_id': userCompanyId,
        'user': user.toMap(), // Assuming User has a toMap method
        'company':
            company.toMap(), // Assuming CompanyProfile has a toMap method
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'UserCompany {userCompanyId: $userCompanyId, userId: ${user.userId}}';
}
