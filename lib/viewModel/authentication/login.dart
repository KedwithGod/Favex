import '/model/utilities/imports/generalImport.dart';

class LoginViewModel extends BaseModel{

  // password
  


  showPassword() {
    showPasswordBool = !showPasswordBool;
    notifyListeners();
  }

  // email address

  void unfocusAllNodes(String clearKey) {
    clearKey == 'password' ? '' : passwordErrorBool = false;
    clearKey == 'password' ? '' : passwordFocusNode.unfocus();
    clearKey == 'email' ? '' : emailErrorBool = false;
    clearKey == 'email' ? '' : emailFocusNode.unfocus();
  }

  // validate email
  validateEmail() {
    unfocusAllNodes('email');
    if (isValidEmail(emailController.text.trim())) {
      emailErrorBool = false;
      emailErrorText = "";
      emailNotValid = false;
    } else {
      emailErrorBool = true;
      emailErrorText = "Please enter a valid email address.";
      emailNotValid = true;
    }
    notifyListeners();
  }

  validatePassword() {
    unfocusAllNodes('password');
    List<dynamic> error = isValidPasswordText(passwordController.text.trim());
    if (error[0] == true) {
      passwordErrorBool = false;
      passwordErrorText = '';
      passwordNotValid = false;
      showPasswordBool = true;
      notifyListeners();
    } else {
      passwordErrorBool = true;
      passwordErrorText = error[1];
      passwordNotValid = true;
      notifyListeners();
    }
  }

  // change password function
  onChangedFunctionPassword() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus == false) {
        passwordErrorBool = false;
        notifyListeners();
      }
    });
    validatePassword();
  }

  // email onchanged function
  onChangedFunctionEmail() {
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        emailErrorBool = false;
        notifyListeners();
      }
    });
    // validate the email
    validateEmail();
    if (emailController.text.isNotEmpty) {
      showeaSuffixIcon = true;
    } else {
      showeaSuffixIcon = false;
    }
    notifyListeners();
    if (emailController.text.isNotEmpty) {
      showeaSuffixIcon = true;
      notifyListeners();
    }
    if (emailController.text.isEmpty) {
      showeaSuffixIcon = false;
      notifyListeners();
    }
  }

  // first login, and filled loginInbuckt

  eaSuffixFunction() {
    emailController.text = '';
    showeaSuffixIcon = false;
    notifyListeners();
  }

  // remember me logic
  bool rememberme = true;

  switchRememberMe() {
    rememberme = !rememberme;
    notifyListeners();
  }

  // login function


  // Function to revalidate all fields and store them in signUpBucket if valid
  void revalidateAllFields(context) {
    // Revalidate full name

    if (emailNotValid == true) {
      validateEmail();
    } else if (passwordNotValid == true) {
      validatePassword();
    }

    // If all fields are valid, store them in signUpBucket
    if (!emailErrorBool && !passwordNotValid) {
      //  call login function
      emailControllerBucket = emailController.text;
      router.goNamed(lockScreenPageRoute);
     
    }
  }



  
}
