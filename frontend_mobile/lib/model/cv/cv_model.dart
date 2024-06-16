import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend_mobile/model/cv/user_company_model.dart';
import 'package:frontend_mobile/model/cv/language_model.dart';
import 'package:frontend_mobile/model/cv/major_model.dart';
import 'package:frontend_mobile/model/cv/skill_model.dart';
import 'package:frontend_mobile/model/cv/user_award_model.dart';
import 'package:frontend_mobile/model/cv/user_education.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';

// Assuming you have models for User, UserCompany, UserEducation, Skill, Major, Language, and UserAward

class CV {
  final int cvId;
  final User user;
  final String? description;
  final String? jobTitle;
  final UserCompany? userCompany;
  final UserEducation userEducation;
  final Skill userSkill;
  final Major userMajor;
  final Language userLanguage;
  final UserAward userAward;

  CV({
    required this.cvId,
    required this.user,
    this.description,
    this.jobTitle,
    this.userCompany,
    required this.userEducation,
    required this.userSkill,
    required this.userMajor,
    required this.userLanguage,
    required this.userAward,
  });

  CV copyWith({
    int? cvId,
    User? user,
    String? description,
    String? jobTitle,
    UserCompany? userCompany,
    UserEducation? userEducation,
    Skill? userSkill,
    Major? userMajor,
    Language? userLanguage,
    UserAward? userAward,
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
      userEducation:
          UserEducation.fromMap(map['user_education'] as Map<String, dynamic>),
      userSkill: Skill.fromMap(map['user_skill'] as Map<String, dynamic>),
      userMajor: Major.fromMap(map['user_major'] as Map<String, dynamic>),
      userLanguage:
          Language.fromMap(map['user_language'] as Map<String, dynamic>),
      userAward: UserAward.fromMap(map['user_award'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'cv_id': cvId,
        'user': user.toMap(), // Assuming User has a toMap method
        'description': description,
        'job_title': jobTitle,
        'user_company': userCompany?.toMap(), // Handle null case
        'user_education': userEducation.toMap(),
        'user_skill': userSkill.toMap(),
        'user_major': userMajor.toMap(),
        'user_language': userLanguage.toMap(),
        'user_award': userAward.toMap(),
      };
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CV {cvId: $cvId, userId: ${user.userId}}';
}
