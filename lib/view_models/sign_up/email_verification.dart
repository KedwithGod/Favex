import '/model/utilities/imports/shared.dart';

class EmailVerificationViewModel extends BaseModel {
  Future<void> sendOtpFunction(
    BuildContext context, {
    required String email,
    required String purpose,
  }) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        sendGuestOtpUrl, // e.g. "/v1/otp/send"
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

        SchedulerBinding.instance.addPostFrameCallback((_) =>
            snackBarWidget(context, text: jsonData["message"], action: () {
              // set user as guest
             isUserGuestBucket = true;
              
              context.goNamed(
                enterOTPCodePageRoute,
                extra: {
                  'nextPage': createAccountPageRoute,
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
        email: emailControllerBucket!, purpose: 'create_account');
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
}
