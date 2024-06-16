import 'dart:convert';

class Language {
  final int languageId;
  final String languageName;

  Language({
    required this.languageId,
    required this.languageName,
  });

  Language copyWith({
    int? languageId,
    String? languageName,
  }) {
    return Language(
      languageId: languageId ?? this.languageId,
      languageName: languageName ?? this.languageName,
    );
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      languageId: map['language_id'] as int,
      languageName: map['language_name'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'language_id': languageId,
        'language_name': languageName,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => languageName;
}
