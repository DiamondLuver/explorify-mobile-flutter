import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/model/cv/language_model.dart';
import 'package:frontend_mobile/model/cv/major_model.dart';
import 'package:frontend_mobile/model/cv/skill_model.dart';
import 'package:frontend_mobile/model/cv/user_award_model.dart';
import 'package:frontend_mobile/model/cv/user_company_model.dart';
import 'package:frontend_mobile/model/cv/user_education.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;

class CvGenerateService {
  List<CV> cv = [];
  void getCV({
    required BuildContext context,
    required cvId,
    required User user,
    required String description,
    required String jobTitle,
    required UserCompany userCompany,
    required UserEducation userEducation,
    required Skill userSkill,
    required Major userMajor,
    required Language userLanguage,
    required UserAward userAward,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$url/api/v1/cv-form-data/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.loginToken,
        },
      );
      if (!context.mounted) return;
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            // onSuccess();
            // onOrderPickedUp();
            showSnackBar(context, "Order has been picked up!");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
