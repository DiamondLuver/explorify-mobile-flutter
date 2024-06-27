import 'dart:convert';

class CompanyProfile {
  final int companyId;
  final String? companyName;
  final String? description;
  final String? location;

  CompanyProfile({
    required this.companyId,
    this.companyName,
    this.description,
    this.location,
  });
  CompanyProfile copyWith({
    int? companyId,
    String? companyName,
    String? description,
    String? location,
  }) {
    return CompanyProfile(
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      description: description ?? this.description,
      location: location ?? this.location,
    );
  }

  factory CompanyProfile.fromMap(Map<String, dynamic> map) {
    return CompanyProfile(
      companyId: map['company_id'] as int,
      companyName: map['company_name'] as String?,
      description: map['description'] as String?,
      location: map['location'] as String?,
    );
  }
  Map<String, dynamic> toMap() => {
        'company_id': companyId,
        'company_name': companyName,
        'description': description,
        'location': location,
      };

  String toJson() => json.encode(toMap());
  factory CompanyProfile.fromJson(String source) =>
      CompanyProfile.fromMap(json.decode(source));
}
