import 'dart:convert';

class Skill {
  final int skillId;
  final String skillName;

  Skill({
    required this.skillId,
    required this.skillName,
  });

  Skill copyWith({
    int? skillId,
    String? skillName,
  }) {
    return Skill(
      skillId: skillId ?? this.skillId,
      skillName: skillName ?? this.skillName,
    );
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      skillId: map['skill_id'] as int,
      skillName: map['skill_name'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'skill_id': skillId,
        'skill_name': skillName,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => skillName;
}
