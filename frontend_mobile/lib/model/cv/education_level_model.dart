import 'dart:convert';

class EducationLevel {
  final int educationLevelId;
  final String educationName;

  EducationLevel({
    required this.educationLevelId,
    required this.educationName,
  });
  EducationLevel copyWith({
    int? educationLevelId,
    String? educationName,
  }) {
    return EducationLevel(
      educationLevelId: educationLevelId ?? this.educationLevelId,
      educationName: educationName ?? this.educationName,
    );
  }

  factory EducationLevel.fromMap(Map<String, dynamic> map) {
    return EducationLevel(
      educationLevelId: map['education_level_id'] as int,
      educationName: map['education_name'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        "education_level_id": educationLevelId,
        "education_name": educationName,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => educationName;
}
