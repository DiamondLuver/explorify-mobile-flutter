import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend_mobile/model/user/education_level_model.dart';
import 'package:frontend_mobile/model/user/school_model.dart';
import 'package:frontend_mobile/model/user/user_model.dart';

// Assuming you have models for User, School, and EducationLevel

class UserEducation {
  final int userEducationId;
  final User user;
  final School school;
  final EducationLevel? educationLevel;
  final DateTime startDate;
  final DateTime endDate;

  UserEducation({
    required this.userEducationId,
    required this.user,
    required this.school,
    this.educationLevel,
    required this.startDate,
    required this.endDate,
  });

  UserEducation copyWith({
    int? userEducationId,
    User? user,
    School? school,
    EducationLevel? educationLevel,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return UserEducation(
      userEducationId: userEducationId ?? this.userEducationId,
      user: user ?? this.user,
      school: school ?? this.school,
      educationLevel: educationLevel ?? this.educationLevel,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  factory UserEducation.fromMap(Map<String, dynamic> map) {
    return UserEducation(
      userEducationId: map['user_education_id'] as int,
      user: map['user'] = User.fromMap(map['user'] as Map<String, dynamic>),
      school: map['school'] =
          School.fromMap(map['school'] as Map<String, dynamic>),
      educationLevel: map['education_level'] != null
          ? EducationLevel.fromMap(
              map['education_level'] as Map<String, dynamic>)
          : null,
      startDate: DateTime.parse(map['start_date'] as String),
      endDate: DateTime.parse(map['end_date'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'user_education_id': userEducationId,
        'user': user.toMap(), // Assuming User has a toMap method
        'school': school.toMap(), // Assuming School has a toMap method
        'education_level':
            educationLevel?.toMap(), // Include educationLevel only if not null
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      };

    String toJson() => json.encode(toMap());

  @override
  String toString() => 'Education for User ${user.userId}';
}
