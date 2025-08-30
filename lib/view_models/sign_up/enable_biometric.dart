import '/model/utilities/imports/shared.dart';

class EnableBiometricViewModel extends BaseModel{

  Future<void> registerBiometricFunction(
  BuildContext context) async {
  await runFunctionForApi(
    context,
    functionToRunService: networkService.postRequest(
      context,
      registerBiometricUrl, // e.g. "/v1/user/biometric/register"
      {
        "email": emailControllerBucket,
      },
      (data) => data, // raw response map
    ),
    functionToRunAfterService: (result) async {
      final GeneralResponse response = result;

      if (response.success) {
        final message = response.data[0]["message"] ?? textBucket!.biometricRegistrationFailed;

        snackBarWidget(
          context,
          text: message,
          title: textBucket!.biometricRegistration,
          action: () {
            print("Biometric registered successfully ✅");
            // You can navigate or trigger next steps here
             context.goNamed(homePageRoute);
          },
        );
      } else {
        snackBarWidget(
          context,
          text: response.error.toString(),
          title: textBucket!.biometricRegistrationFailed,
        );
      }
    },
  );
}


}