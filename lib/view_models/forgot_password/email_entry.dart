import '/model/utilities/imports/shared.dart';

class EmailEntryViewModel extends BaseModel {
  Future<void> sendOtpFunction(
    BuildContext context, {
    required String email,
    required String purpose,
  }) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        sendOtpUrl, // e.g. "/v1/otp/send"
        {
          "email": email.trim(),
          "purpose": purpose.trim(),
        },
        (data) => data, // raw map
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        // ✅ at this point success is guaranteed
        final Map<String, dynamic> jsonData = response.data[0];

        SchedulerBinding.instance.addPostFrameCallback((_) => snackBarWidget(
                context,
                text: jsonData["message"] ?? "OTP sent successfully",
                action: () {
              context.goNamed(
                enterOTPCodePageRoute,
                extra: {
                  'nextPage': createNewPasswordPageRoute,
                  'bottomSheetSubtitle':
                      textBucket!.verificationCompletedNextStepButton,
                },
              );
            }));

      },
    );
  }

  sendOtp(BuildContext context) {
    //  function to resend otp
    sendOtpFunction(context,
        email: emailControllerBucket!, purpose: 'password_reset');
  }

  revalidateAllFields(BuildContext context) {
    if (emailNotValid == true) {
      validateEmail();
    } else {
      // set up email controller
      emailControllerBucket = emailController.text.trim();
      sendOtp(context);
    }
  }

    // update otpvalue
  otpOnCompleteFunction(String value) {
    if (testOTP == value) {
      otpErrorBool = false;
    } else {
      otpErrorBool = true;
      otpErrorText = textBucket!.incorrectOTPAttempt;
    }
    notifyListeners();
  }

  Future<void> validateOtpFunction(
  BuildContext context, {
    String? value
// e.g. "password_reset" or "verify_email"
}) async {
  await runFunctionForApi(
    context,
    functionToRunService: networkService.postRequest(
      context,
      validateOtpUrl, // e.g. "/v1/otp/validate"
      {
        "email": emailControllerBucket!,
        "otp": value ,
        "purpose": 'password_reset',
      },
      (data) => data,
    ),
    functionToRunAfterService: (result) async {
      final GeneralResponse response = result;

      if (response.success) {
        final message = response.data[0]["message"] ?? "OTP validated successfully";
          otpErrorBool = false;

        snackBarWidget(
          context,
          text: message,
          title: textBucket!.otpVerification,
          action: () {
            // For example: navigate to reset password or home
            print("OTP validated → next action here");
          },
        );
      } else {
        otpErrorBool = true;
        otpErrorText = textBucket!.incorrectOTPAttempt;
        snackBarWidget(
          context,
          text: response.error.toString(),
          title: "Validation Failed",
        );
      }
    },
  );
}

}
