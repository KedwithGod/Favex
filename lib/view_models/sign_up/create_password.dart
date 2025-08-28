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
      router.goNamed(createTransactionPIndPage);
    }
  }
}
