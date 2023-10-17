String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Please enter your email';
  }
  if (!isValidEmail(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validateUsername(String value) {
  if (value.isEmpty) {
    return 'Please enter username';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

bool isValidEmail(String value) {
  final pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';

  final regex = RegExp(pattern);
  return regex.hasMatch(value);
}
