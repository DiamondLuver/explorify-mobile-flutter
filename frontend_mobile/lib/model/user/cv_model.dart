import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend_mobile/model/user/language_model.dart';
import 'package:frontend_mobile/model/user/major_model.dart';
import 'package:frontend_mobile/model/user/skill_model.dart';
import 'package:frontend_mobile/model/user/user_award_model.dart';
import 'package:frontend_mobile/model/user/user_company_model.dart';
import 'package:frontend_mobile/model/user/user_education.dart';
import 'package:frontend_mobile/model/user/user_model.dart';

// Assuming you have models for User, UserCompany, UserEducation, Skill, Major, Language, and UserAward

class CV {
  final int cvId;
  final User user;
  final String? description;
  final String? jobTitle;
  final UserCompany? userCompany;
  final List<UserEducation> userEducation;
  final List<Skill> userSkill;
  final List<Major> userMajor;
  final List<Language> userLanguage;
  final List<UserAward> userAward;

  CV({
    required this.cvId,
    required this.user,
    this.description,
    this.jobTitle,
    this.userCompany,
    this.userEducation = const [],
    this.userSkill = const [],
    this.userMajor = const [],
    this.userLanguage = const [],
    this.userAward = const [],
  });

  CV copyWith({
    int? cvId,
    User? user,
    String? description,
    String? jobTitle,
    UserCompany? userCompany,
    List<UserEducation>? userEducation,
    List<Skill>? userSkill,
    List<Major>? userMajor,
    List<Language>? userLanguage,
    List<UserAward>? userAward,
  }) {
    return CV(
      cvId: cvId ?? this.cvId,
      user: user ?? this.user,
      description: description ?? this.description,
      jobTitle: jobTitle ?? this.jobTitle,
      userCompany: userCompany ?? this.userCompany,
      userEducation: userEducation ?? this.userEducation,
      userSkill: userSkill ?? this.userSkill,
      userMajor: userMajor ?? this.userMajor,
      userLanguage: userLanguage ?? this.userLanguage,
      userAward: userAward ?? this.userAward,
    );
  }

  factory CV.fromMap(Map<String, dynamic> map) {
    return CV(
      cvId: map['cv_id'] as int,
      user: User.fromMap(map['user']
          as Map<String, dynamic>), // Assuming User has a fromMap factory
      description: map['description'] as String?,
      jobTitle: map['job_title'] as String?,
      userCompany: map['user_company'] != null
          ? UserCompany.fromMap(map['user_company'] as Map<String, dynamic>)
          : null,
      userEducation: (map['user_education'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>()
              .map((e) => UserEducation.fromMap(e))
              .toList() ??
          const [],
      userSkill: (map['user_skill'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>()
              .map((e) => Skill.fromMap(e))
              .toList() ??
          const [],
      userMajor: (map['user_major'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>()
              .map((e) => Major.fromMap(e))
              .toList() ??
          const [],
      userLanguage: (map['user_language'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>()
              .map((e) => Language.fromMap(e))
              .toList() ??
          const [],
      userAward: (map['user_award'] as List<dynamic>?)
              ?.cast<Map<String, dynamic>>()
              .map((e) => UserAward.fromMap(e))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toMap() => {
        'cv_id': cvId,
        'user': user.toMap(), // Assuming User has a toMap method
        'description': description,
        'job_title': jobTitle,
        'user_company': userCompany?.toMap(), // Handle null case
        'user_education': userEducation.map((e) => e.toMap()).toList(),
        'user_skill': userSkill.map((e) => e.toMap()).toList(),
        'user_major': userMajor.map((e) => e.toMap()).toList(),
        'user_language': userLanguage.map((e) => e.toMap()).toList(),
        'user_award': userAward.map((e) => e.toMap()).toList(),
      };
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CV {cvId: $cvId, userId: ${user.userId}}';
}
