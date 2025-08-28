import '../model/utilities/imports/shared.dart';

class BaseModel extends ChangeNotifier {
  // timer
  int counter = 5 * 60; // 5 minutes in seconds
  Timer? timer;
  String testUser = 'Kingdammy';

  // Maps for colors
  static const Map<String, AppColors> colorMap = {
    "light": AppColors.light,
    "dark": AppColors.dark,
    // Add more themes if necessary
  };

  // Maps for texts
  static const Map<String, AppTexts> textMap = {
    "english": AppTexts.english,
    "spanish": AppTexts.spanish,
    // Add more languages if necessary
  };

  TextEditingController emailController = TextEditingController();
  bool emailErrorBool = false;
  String emailErrorText = "";
  FocusNode emailFocusNode = FocusNode();
  bool showeaSuffixIcon = false;
  bool emailNotValid = true;

  TextEditingController passwordController = TextEditingController();
  bool passwordErrorBool = false;
  FocusNode passwordFocusNode = FocusNode();
  bool showPasswordBool = true;
  String passwordErrorText = '';
  bool passwordNotValid = true;

  
  // confirmPassword
  TextEditingController confirmPasswordController = TextEditingController();
  bool confirmPasswordErrorBool = false;
  String confirmPasswordErrorText = '';
  bool confirmPasswordNotValid = true;
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool showConfirmPasswordBool = true;

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
    clearKey == 'confirmPassword' ? '' : confirmPasswordErrorBool = false;
    clearKey == 'confirmPassword' ? '' : confirmPasswordFocusNode.unfocus();
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

  setAppColors(BuildContext context) async {
    String? theme = await LocalStorage.getString(themePS);
    String? language = await LocalStorage.getString(languagePS);

    // Set colors based on theme
    if (theme == null || theme.isEmpty || !colorMap.containsKey(theme)) {
      colorsBucket = colorMap["light"]!; // Default to light
    } else {
      colorsBucket = colorMap[theme]!;
    }

    // Set texts based on language
    if (language == null ||
        language.isEmpty ||
        !textMap.containsKey(language)) {
      textBucket = textMap["english"]!; // Default to English
    } else {
      textBucket = textMap[language]!;
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  // otp variables
  TextEditingController? otpController;
  bool otpErrorBool = false;
  FocusNode otpFocusNode = FocusNode();
  FocusNode deleteButtonFocusNode = FocusNode();
  String otpValue = '';
  String otpErrorText = '';
  String testOTP = '123456';

  otpOnChangedFunction(
    String value,
  ) {
    otpErrorBool = false;

    otpValue = value;
    notifyListeners();
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
}
