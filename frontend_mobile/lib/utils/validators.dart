String? validateEmail(String? value) {
  if(value == null || value.isEmpty) {
    return 'email address required';
  }
  // else if (()..hasMatch(value)) {
  //   return 'invalid email address';
  // }
  return null;
}

String? validatePassword(String? value) {
  if(value == null || value.isEmpty) {
    return 'password required';
  }
  // else if (()..hasMatch(value)) {
  //   return 'invalid email address';
  // }
  return null;
}