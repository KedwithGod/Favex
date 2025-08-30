class  AuthResponse {
  final String message;
  final bool? biometricEnabled; // only in login response
  final User? user;             // only in register response
  final String token;

   AuthResponse({
    required this.message,
    this.biometricEnabled,
    this.user,
    required this.token,
  });

  factory  AuthResponse.fromJson(Map<String, dynamic> json) {
    return  AuthResponse(
      message: json['message'] ?? '',
      biometricEnabled: json['biometric_enabled'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (biometricEnabled != null) 'biometric_enabled': biometricEnabled,
      if (user != null) 'user': user!.toJson(),
      'token': token,
    };
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }
}
