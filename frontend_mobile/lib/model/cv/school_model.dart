import 'dart:convert';

class School {
  final int schoolId;
  final String schoolName;

  School({
    required this.schoolId,
    required this.schoolName,
  });

  School copyWith({
    int? schoolId,
    String? schoolName,
  }) {
    return School(
      schoolId: schoolId ?? this.schoolId,
      schoolName: schoolName ?? this.schoolName,
    );
  }

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      schoolId: map['school_id'] as int,
      schoolName: map['school_name'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'school_id': schoolId,
        'school_name': schoolName,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => schoolName;
}
