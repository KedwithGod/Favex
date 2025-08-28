import '/model/utilities/imports/shared.dart';

class CreatePasswordViewMoel extends BaseModel{



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
}