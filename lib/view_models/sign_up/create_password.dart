import '/model/utilities/imports/shared.dart';

class CreatePasswordViewModel extends CreateNewPasswordViewMoel {
  dynamic true_result = {};

  validatePasswordNew() {
    unfocusAllNodes('password');
    List<dynamic> error = isValidPassword(passwordController.text.trim())[1];
    true_result = isValidPassword(passwordController.text.trim())[0];

    if (error[0] == true) {
      passwordErrorBool = false;
      passwordErrorText = '';
      passwordNotValid = false;
      notifyListeners();

      if (passwordController.text.trim() !=
          confirmPasswordController.text.trim()) {
        confirmPasswordErrorBool = true;
        confirmPasswordErrorText = error[1];
        confirmPasswordNotValid = true;
        notifyListeners();
      }
      if (passwordController.text.trim() ==
          confirmPasswordController.text.trim()) {
        confirmPasswordErrorBool = false;
        confirmPasswordErrorText = '';
        confirmPasswordNotValid = false;

        notifyListeners();
      }
    } else {
      passwordErrorBool = true;
      // passwordErrorText =
      //     error[1];
      passwordNotValid = true;
      notifyListeners();
    }
  }

  // change password function
  onChangedFunctionPasswordNew() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus == false) {
        passwordErrorBool = false;
        notifyListeners();
      }
    });
    validatePasswordNew();
  }

  void restPasseordValidateAllFields(BuildContext context) async {
    // Revalidate full name

    if (passwordNotValid == true) {
      validatePasswordNew();
    } else if (confirmPasswordNotValid == true) {
      validateConfirmPassword();
    }
    // If all fields are valid, store them in signUpBucket
    else {
      registerUserFunction(context);
    }
  }

  Future<void> registerUserFunction(BuildContext context) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        signUpUrl, // e.g. "/v1/auth/register"
        {
          "first_name": signUpdatabucket!.firstName,
          "last_name": signUpdatabucket!.lastName,
          "username": signUpdatabucket!.username,
          "email": signUpdatabucket!.email,
          "phone": signUpdatabucket!.phone,
          "password": passwordController.text.trim(),
          "where_heard": whereYouFindUsBucket,
          "referral_tag": referralTagBucket,
        },
        (data) => data, // raw response map
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        if (response.success) {
          final Map<String, dynamic> jsonData = response.data[0];

          final String message =
              jsonData["message"] ?? "Account created successfully";
          final String token = jsonData["token"];
          final Map<String, dynamic> user = jsonData["user"];
          await LocalStorage.setString(tokenKeyPS, token ?? "");
          await LocalStorage.setString(userDataPS, jsonEncode(user));

          // Show success feedback
          snackBarWidget(
            context,
            text: message,
            title: textBucket!.registrationSuccess,
            action: () {
              // For example: redirect to home page after register
              print("User Registered: $user");
            },
          );
          // go to transaction page
          router.goNamed(createTransactionPinPageRoute);
        } else {
          // Handle error
          snackBarWidget(
            context,
            text: response.error.toString(),
            title: textBucket!.registrationFailed,
          );
        }
      },
    );
  }
}
