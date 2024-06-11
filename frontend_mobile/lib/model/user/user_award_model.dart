import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend_mobile/model/user/user_model.dart';

// Assuming you might have a File class for handling files

class UserAward {
  final int userAwardId;
  final User user;
  final String awardName;
  final String? certificateFile;
  final String? awardCategory;
  final DateTime? date;
  final String? description;

  UserAward({
    required this.userAwardId,
    required this.user,
    required this.awardName,
    this.certificateFile,
    this.awardCategory,
    this.date,
    this.description,
  });
  UserAward copyWith({
    int? userAwardId,
    User? user,
    String? awardName,
    String? certificateFile,
    String? awardCategory,
    DateTime? date,
    String? description,
  }) {
    return UserAward(
      userAwardId: userAwardId ?? this.userAwardId,
      user: user ?? this.user,
      awardName: awardName ?? this.awardName,
      certificateFile: certificateFile ?? this.certificateFile,
      awardCategory: awardCategory ?? this.awardCategory,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }
  factory UserAward.fromMap(Map<String, dynamic> map) {
    return UserAward(
      userAwardId: map['user_award_id'] as int,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      awardName: map['award_name'] as String,
      certificateFile: map['certificate_file'] as String?,
      awardCategory: map['award_category'] as String?,
      date: map['date'] != null ? DateTime.parse(map['date'] as String) : null,
      description: map['description'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'user_award_id': userAwardId,
    'user': user.toMap(), // Assuming User has a toMap method
    'award_name': awardName,
    'certificate_file': certificateFile,
    'award_category': awardCategory,
    'date': date?.toIso8601String(), // Include date only if not null
    'description': description,
  };

    String toJson() => json.encode(toMap());


  @override
  String toString() => 'Award ${awardName} for User ${user.userId}';
}
