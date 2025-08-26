List<dynamic> isValidPassword(String password,
    {int minLength = 8, int specialCount = 1}) {
  if (!hasMinLength(password, minLength)) {
    return [{},[false, 'Password must be at least $minLength characters long.']];
  }

  if (!hasMinNormalChar(password, 1)) {
    return [{'char_length':true},[
      false,
      'Password must contain at least 1 normal character (uppercase letter).'
    ]];
  }

  if (!hasMinUppercase(password, 1)) {
    return [{'char_length':true},[false, 'Password must contain at least 1 uppercase letter.']];
  }

  if (!hasMinLowercase(password, 1)) {
    return [{'char_length':true,'upper_case':true},[false, 'Password must contain at least 1 lowercase letter.']];
  }

  if (!hasMinNumericChar(password, 1)) {
    return [{'char_length':true,'upper_case':true,'lower_case':true},[false, 'Password must contain at least 1 numeric character.']];
  }

  if (!hasMinSpecialChar(password, specialCount)) {
    return [{'char_length':true,'upper_case':true,'lower_case':true,'numeric':true},[
      false,
      'Password must contain at least $specialCount special character(s).'
    ]];
  }

  return [{'char_length':true,'upper_case':true,'lower_case':true,'numeric':true,'special':true},[true, '']];


}

List<dynamic> isValidPasswordText(String password,
    {int minLength = 8, int specialCount = 1}) {
  if (!hasMinLength(password, minLength)) {
    return [false, 'Password must be at least $minLength characters long.'];
  }

  if (!hasMinNormalChar(password, 1)) {
    return [
      false,
      'Password must contain at least 1 normal character (uppercase letter).'
    ];
  }

  if (!hasMinUppercase(password, 1)) {
    return [false, 'Password must contain at least 1 uppercase letter.'];
  }

  if (!hasMinLowercase(password, 1)) {
    return [false, 'Password must contain at least 1 lowercase letter.'];
  }

  if (!hasMinNumericChar(password, 1)) {
    return [false, 'Password must contain at least 1 numeric character.'];
  }

  if (!hasMinSpecialChar(password, specialCount)) {
    return [
      false,
      'Password must contain at least $specialCount special character(s).'
    ];
  }

  return [true, ''];
}

bool hasMinLength(String password, int minLength) {
  return password.length >= minLength;
}

bool hasMinNormalChar(String password, int normalCount) {
  String pattern = '^(.*?[A-Z]){$normalCount,}';
  return password.toUpperCase().contains(RegExp(pattern));
}

bool hasMinUppercase(String password, int uppercaseCount) {
  String pattern = '^(.*?[A-Z]){$uppercaseCount,}';
  return password.contains(RegExp(pattern));
}

bool hasMinLowercase(String password, int lowercaseCount) {
  String pattern = '^(.*?[a-z]){$lowercaseCount,}';
  return password.contains(RegExp(pattern));
}

bool hasMinNumericChar(String password, int numericCount) {
  String pattern = '^(.*?[0-9]){$numericCount,}';
  return password.contains(RegExp(pattern));
}

bool hasMinSpecialChar(String password, int specialCount) {
  String pattern =
      r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ",}";
  return password.contains(RegExp(pattern));
}
