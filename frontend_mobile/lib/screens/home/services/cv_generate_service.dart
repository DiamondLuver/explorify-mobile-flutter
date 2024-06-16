import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;

class CvGenerateService {
  // fetch all cv information
  Future<List<CV>> getCV(BuildContext context) async {
    List<CV> cv = [];

    try {
      http.Response response = await http.get(
        Uri.parse('http://localhost:8989/api/v1/cv-form-data/'),
        headers: {
          'Content-Type': 'application/json;',
          // 'x-auth-token': userProvider.user.loginToken,
        },
      );
      print(response.body);
      print("got data");
      if (!context.mounted) return cv;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            cv.add(
              CV.fromJson(
                jsonEncode(jsonDecode(response.body)[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
      print("Error fetching data: $e"); // Log the error message
    }
    return cv;
  }
}



    // required BuildContext context,
    // required cvId,
    // required User user,
    // required String description,
    // required String jobTitle,
    // required UserCompany userCompany,
    // required UserEducation userEducation,
    // required Skill userSkill,
    // required Major userMajor,
    // required Language userLanguage,
    // required UserAward userAward,
