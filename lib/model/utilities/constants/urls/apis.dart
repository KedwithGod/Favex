import '../../imports/shared.dart';

String baseUrl() {
  if (kIsWeb) {
    return 'http://localhost:8000/api/v1/';
  } else if (Platform.isAndroid) {
    return 'http://10.0.2.2:8000/api/v1/';
  } else if (Platform.isIOS) {
    return 'http://localhost:8000/api/v1/';
  } else {
    return 'http://127.0.0.1:8000/api/v1/';
  }
}

// authentication urls
const String loginUrl = "auth/login";
const String signUpUrl = "auth/signup";
const String sendOtpUrl = "auth/otp/send";
const String validateOtpUrl = "auth/otp/verify";
const String biometricLoginUrl = "auth/biometric-login";
const String socialAuthUrl = "auth/social-auth";
const String checkExistenceUrl = "auth/check-existence";
const String checkBusinessNameUrl = "auth/check-business-name";
const String forgotPasswordUrl = "auth/forgot-password";
const String resetPasswordUrl = "auth/reset-password";
const String changePasswordUrl = "auth/password/reset";

