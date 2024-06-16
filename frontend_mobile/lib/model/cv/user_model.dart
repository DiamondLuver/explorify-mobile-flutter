import 'dart:convert';


// Assuming you have a class for PermissionsMixin (if needed)

class User {
  final int userId;
  final String username;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? phone;
  final String? location;
  final String? school;
  final String? headline;

  User({
    required this.userId,
    required this.username,
    this.firstName,
    this.lastName,
    required this.email,
    this.phone,
    this.location,
    this.school,
    this.headline,
  });

  User copyWith({
    int? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? location,
    String? school,
    String? headline,
  }) {
    return User(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      school: school ?? this.school,
      headline: headline ?? this.headline,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'] as int,
      username: map['username'] as String,
      firstName: map['first_name'] as String?,
      lastName: map['last_name'] as String?,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      location: map['location'] as String?,
      school: map['school'] as String?,
      headline: map['headline'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'location': location,
        'school': school,
        'headline': headline,
      };
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'User {userId: $userId, username: $username}';
}
