import '../imports/shared.dart';

Future<bool> userHasBiometric() async {
  try {
    return await auth.canCheckBiometrics;
  } catch (e) {
    return false;
  }
}

Future<List<BiometricType>> userBiometricList() async {
  List<BiometricType> availableBiometrics;
  try {
    availableBiometrics = await auth.getAvailableBiometrics();
    return availableBiometrics;
  } catch (e) {
    return [];
  }
}

Future<List<dynamic>> authenticate() async {
  bool authenticated = false;
  try {
    authenticated = await auth.authenticate(
      localizedReason: textBucket!.scanFingerprint,
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
      ),
    );
  } catch (e) {
    return [false, textBucket!.authError];
  }

  return authenticated
      ? [true, textBucket!.authorized]
      : [false, textBucket!.notAuthorized];
}

Future<void> openBiometric(BuildContext context, {VoidCallback? action}) async {
  bool hasBiometric = await userHasBiometric();

  if (!hasBiometric) {
    // Show a message if biometric is not available
    snackBarWidget(context,
        title: textBucket!.biometricAuthentication,
        text: textBucket!.biometricNotAvailable);
        

    return;
  }

  List<BiometricType> biometrics = await userBiometricList();

  if (biometrics.isEmpty) {
    // Show a message if no biometrics are enrolled
    snackBarWidget(context,
        title: textBucket!.biometricAuthentication,
        text: textBucket!.noBiometricsEnrolled);

    return;
  }

  List<dynamic> authResult = await authenticate();

  if (authResult[0] == true) {
    // Successful authentication
    snackBarWidget(
      context,
      text: authResult[1],
      title: textBucket!.biometricAuthentication,
      action: action
    );

    // Handle successful authentication (e.g., navigate to another screen)
  } else {
    // Failed authentication
    snackBarWidget(
      context,
      text: authResult[1],
      title: textBucket!.biometricAuthentication,
    );
  }
}
