

import '../imports/generalImport.dart';

Future<dynamic> userHasBiometric() async {
  try {
    return await auth.canCheckBiometrics;
  } catch (e) {
    return false;
  }
}

Future userBiometricList() async {
  List<BiometricType> availableBiometrics;
  try {
    availableBiometrics = await auth.getAvailableBiometrics();
    return availableBiometrics;
  } catch (e) {
    availableBiometrics = [];
    return availableBiometrics;
  }
}

Future<List> authenticate() async {
  bool authenticated = false;
  try {
    authenticated = await auth.authenticate(
      localizedReason: 'Scan your fingerprint (or face) to Login',
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
      ),
    );
  } catch (e) {
    return [false,'An Error occur why authenticating, trya again'];
  }
  
    return authenticated ? [true,'Authorized'] : [false,'Not Authorized'];
 
}
