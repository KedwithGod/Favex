import '/model/utilities/imports/shared.dart';

class CreateNewPasswordViewMoel extends BaseModel {
  showConfirmPassword() {
    showConfirmPasswordBool = !showConfirmPasswordBool;
    notifyListeners();
  }

  validateConfirmPassword() {
    unfocusAllNodes('confirmPassword');
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      confirmPasswordErrorBool = false;
      confirmPasswordErrorText = '';
      confirmPasswordNotValid = false;
      notifyListeners();
    } else {
      confirmPasswordErrorBool = true;
      confirmPasswordErrorText =
          'Confirm Password should be the same as password';
      confirmPasswordNotValid = true;
      notifyListeners();
    }
  }

  onChangedFunctionConfirmPassword() {
    confirmPasswordFocusNode.addListener(() {
      if (confirmPasswordFocusNode.hasFocus == false) {
        confirmPasswordErrorBool = false;
        notifyListeners();
      }
    });
    validateConfirmPassword();
  }

  Future<void> validateOtpFunction(BuildContext context) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        changePasswordUrl, // e.g. "/v1/otp/validate"
        {
          "email": emailControllerBucket!,
          "password": passwordController.text.trim(),
        },
        (data) => data,
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        if (response.success) {
          final message =
              response.data[0]["message"] ?? "OTP validated successfully";
          otpErrorBool = false;

          ConfirmationSheet.show(
                                context,
                                title: textBucket!.newPasswordCreated,
                                subtitle:
                                    textBucket!.newPasswordCreationCompleted,
                                buttonText: textBucket!.logOut,
                                onPressed: () {
                                  router.goNamed(loginPageRoute);
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

  void revalidateAllFields(BuildContext context) {
    if(passwordNotValid==true){
      validatePassword();

    }
    else if (confirmPasswordNotValid==true){
      validateConfirmPassword();
    }
    else{
      validateOtpFunction(context);
    }
  }
}
