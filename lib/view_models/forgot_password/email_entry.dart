import '/model/utilities/imports/shared.dart';

class EmailEntryViewModel extends BaseModel {
  bool isbusy = false;
  Future<void> sendOtpFunction(
    BuildContext context, {
    required String email,
    required String purpose,
  }) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        isUserGuestBucket ? sendGuestOtpUrl: sendOtpUrl, // e.g. "/v1/otp/send"
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
                      textBucket!.verificationCompletedPassword,
                },
              );
            }));
      },
    );
  }

  sendOtp(BuildContext context) {
    //  function to resend otp
    sendOtpFunction(context,
        email: emailControllerBucket!, purpose:  isUserGuestBucket ? "create_account" : "password_reset");
        print(emailControllerBucket!);
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
  otpOnCompleteFunction(failed) {
    if (failed == false) {
      otpErrorBool = false;
    } else {
      otpErrorBool = true;
      otpErrorText = textBucket!.incorrectOTPAttempt;
    }
    notifyListeners();
  }

  Future<bool> validateOtpFunction(
    BuildContext context, {
    required String otp,
  }) async {
    isbusy = true;
    notifyListeners();
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl(),
        connectTimeout: const Duration(seconds: timeoutDuration),
        receiveTimeout: const Duration(seconds: timeoutDuration),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
        },
      ),
    );

    final url = isUserGuestBucket ? validateGuestOtpUrl : validateOtpUrl;

    final body = {
      "email": emailControllerBucket!,
      "otp": otp.trim(),
      "purpose": isUserGuestBucket ? "create_account" : "password_reset",
    };

    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data;
        print(response.data);

        if (jsonData["success"] == true) {
          final message = (jsonData["data"]?[0]?["message"]) ??
              "OTP validated successfully";
          otpOnCompleteFunction(false);
          snackBarWidget(
            context,
            text: message,
            title: textBucket!.otpVerification,
          );

          return true; // ✅ OTP valid
        } else {
          otpOnCompleteFunction(true);
          snackBarWidget(
            context,
            text: jsonData["error"]?["message"] ?? "Invalid OTP",
            title: "Validation Failed",
          );
          return false; // ❌ OTP invalid
        }
      } else {
        otpOnCompleteFunction(true);

        snackBarWidget(
          context,
          text: "Server error: ${response.statusCode}",
          title: "Validation Failed",
        );
        return false;
      }
    } on DioException catch (e) {
      otpOnCompleteFunction(true);
      print(e.response);
      final errorMsg = e.response?.data?["error"]?["message"] ?? e.message;
      snackBarWidget(
        context,
        text: "Unexpected error: $errorMsg",
        title: "Validation Failed",
      );
      return false;
    } catch (e) {
      print(e);
      otpOnCompleteFunction(true);
      snackBarWidget(
        context,
        text: "Unexpected error: $e",
        title: "Validation Failed",
      );
      return false;
    } finally {
      isbusy = false;
      notifyListeners();
    }
  }
}
