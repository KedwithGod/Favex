import '../../imports/generalImport.dart';

String baseUrl() {
  if (kIsWeb) {
    return 'http://localhost:8000/api/mobile/';
  } else if (Platform.isAndroid) {
    return 'http://10.0.2.2:8000/api/mobile/';
  } else if (Platform.isIOS) {
    return 'http://localhost:8000/api/mobile/';
  } else {
    return 'http://127.0.0.1:8000/api/mobile/';
  }
}

// authentication urls
const String loginUrl = "auth/login";
const String signUpUrl = "auth/signup";
const String sendOtpUrl = "auth/send-otp";
const String validateOtpUrl = "auth/validate-otp";
const String biometricLoginUrl = "auth/biometric-login";
const String socialAuthUrl = "auth/social-auth";
const String checkExistenceUrl = "auth/check-existence";
const String checkBusinessNameUrl = "auth/check-business-name";
const String forgotPasswordUrl = "auth/forgot-password";
const String resetPasswordUrl = "auth/reset-password";
const String changePasswordUrl = "auth/change-password";
const String countriesUrl = "utilities/country";
const String statesUrl = "utilities/state";
const String cityUrl = "utilities/city";

// store management urls
const String storesUrl = "stores"; // GET list, POST create
String storeDetailUrl(String id) => "stores/$id"; // GET, PUT, DELETE
String storeAssignManagerUrl(String id) => "stores/$id/assign-manager"; // POST
String storeBalanceUrl(String id) => "stores/$id/balance"; // GET
