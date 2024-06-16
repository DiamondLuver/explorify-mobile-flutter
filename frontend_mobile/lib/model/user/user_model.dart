class User {
  int? userId; // '?' indicates nullable variable
  String username;
  String? firstName;
  String? lastName;
  String email;
  String? phone;
  String? location;
  String? school;
  String? headline;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    this.userId,
    required this.username,
    this.firstName,
    this.lastName,
    required this.email,
    this.phone,
    this.location,
    this.school,
    this.headline,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['user_id'] as int?,
        username: json['username'] as String,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String,
        phone: json['phone'] as String?,
        location: json['location'] as String?,
        school: json['school'] as String?,
        headline: json['headline'] as String?,
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'location': location,
        'school': school,
        'headline': headline,
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
      };
}
