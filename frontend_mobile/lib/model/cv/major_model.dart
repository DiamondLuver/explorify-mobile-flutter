import 'dart:convert';

class Major {
  final int majorId;
  final String majorName;

  Major({
    required this.majorId,
    required this.majorName,
  });

  Major copyWith({
    int? majorId,
    String? majorName,
  }) {
    return Major(
      majorId: majorId ?? this.majorId,
      majorName: majorName ?? this.majorName,
    );
  }

  factory Major.fromMap(Map<String, dynamic> map) {
    return Major(
      majorId: map['major_id'] as int,
      majorName: map['major_name'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'major_id': majorId,
        'major_name': majorName,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => majorName;
}
