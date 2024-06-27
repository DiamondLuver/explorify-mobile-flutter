String? validateEmail(String? value) {
  final _emailRegExp =
      RegExp(r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@'
          r'(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$');

  if (value == null || value.isEmpty) {
    return 'Please enter your email address.';
  } else if (!_emailRegExp.hasMatch(value.trim())) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password should contain at least one lowercase letter';
  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password should contain at least one uppercase';
  } else if (!RegExp(r'[^\w\s]').hasMatch(value)) {
    return 'Password should contain at least one special character (!@#\$%^&*)';
  }
  return null;
}

String? validateUsername(String? value) {
  final _usernameRegExp =
      RegExp(r'[^\w\s]'); // Allows letters, numbers, ., -, and _

  if (value == null || value.isEmpty) {
    return 'Please enter your username';
  } else if (value.length < 3) {
    return 'Username must contain at least 3 character';
  } else if (_usernameRegExp.hasMatch(value)) {
    return "Username must not contain any special character";
  }
  return null;
}
