import '../../imports/shared.dart';

//TODO: ensure to change this base url when going live

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
const String signUpUrl = "auth/register";
const String sendOtpUrl = "auth/otp/send";
const String sendGuestOtpUrl = "auth/otp/send/guest";
const String validateOtpUrl = "auth/otp/verify";
const String validateGuestOtpUrl = "auth/otp/verify/guest";
const String biometricLoginUrl = "auth/biometric-login";
const String forgotPasswordUrl = "auth/forgot-password";
const String changePasswordUrl = "auth/password/reset";
const String registerBiometricUrl = "auth/biometric/register";
const String setTransactionPinUrl = "auth/set-pin";
const String validateUsernameUrl = "unique/username";
const String validatePhoneUrl = "unique/phone";



