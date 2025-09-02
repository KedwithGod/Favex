import '../model/utilities/imports/shared.dart';

class BaseModel extends ChangeNotifier {

  String username = '';
  String naira = 'NGN';
  String nfx = 'NFX';
  String walletBalance = '560000';
  String nfxBalance = '140000';
  String usd = ' USD \$';
  String nairaSymbol ='₦';
  bool isLoading = false;

  setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }


  setUsername()async{
      username = (await LocalStorage.getUsernameFromPrefs())!;
      notifyListeners();
  }

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


  TextEditingController searchController = TextEditingController();
  bool searchErrorBool = false;
  FocusNode searchFocusNode = FocusNode();
  String searchErrorText = '';
  bool searchNotValid = true;

  // confirmPassword
  TextEditingController confirmPasswordController = TextEditingController();
  bool confirmPasswordErrorBool = false;
  String confirmPasswordErrorText = '';
  bool confirmPasswordNotValid = true;
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool showConfirmPasswordBool = true;

  TextEditingController phonenumberController = TextEditingController();
  bool phonenumberErrorBool = false;
  String phoneErrorText = "";
  FocusNode phonenumberFocusNode = FocusNode();
  bool phoneNotValid = true;

  TextEditingController firstNameController = TextEditingController();
  bool firstNameErrorBool = false;
  String firstNameErrorText = "";
  FocusNode firstNameFocusNode = FocusNode();
  bool showfnSuffixIcon = false;
  bool firstNameNotValid = true;
  
  TextEditingController lastNameController = TextEditingController();
  bool lastNameErrorBool = false;
  String lastNameErrorText = "";
  FocusNode lastNameFocusNode = FocusNode();
  bool showlnSuffixIcon = false;
  bool lastNameNotValid = true;

   
  TextEditingController usernameController = TextEditingController();
  bool usernameErrorBool = false;
  String usernameErrorText = "";
  FocusNode usernameFocusNode = FocusNode();
  bool usernameNotValid = true;

  TextEditingController referralTagController = TextEditingController();
  bool referralTagErrorBool = false;
  String referralTagErrorText = "";
  FocusNode referralTagFocusNode = FocusNode();
  bool referralTagNotValid = false;

  TextEditingController cryptoController = TextEditingController();
  bool cryptoErrorBool = false;
  String cryptoErrorText = '';
  bool cryptoNotValid = true;
  FocusNode cryptoFocusNode = FocusNode();

  TextEditingController cardValueController = TextEditingController();
  bool cardValueErrorBool = false;
  String cardValueErrorText = '';
  bool cardValueNotValid = true;
  FocusNode cardValueFocusNode = FocusNode();
 

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
    clearKey == 'firstName' ? '' : firstNameErrorBool = false;
    clearKey == 'firstName' ? '' : firstNameFocusNode.unfocus();
    clearKey == 'lastName' ? '' : lastNameErrorBool = false;
    clearKey == 'lastName' ? '' : lastNameFocusNode.unfocus();
    clearKey == 'username' ? '' : usernameErrorBool = false;
    clearKey == 'username' ? '' : usernameFocusNode.unfocus();
    clearKey == 'phone' ? '' : phonenumberErrorBool = false;
    clearKey == 'phone' ? '' : phonenumberFocusNode.unfocus();
    clearKey == 'referralTag' ? '' : referralTagErrorBool = false;
    clearKey == 'referralTag' ? '' : referralTagFocusNode.unfocus();
    clearKey == 'crypto_usd' ? '' : cryptoErrorBool = false;
    clearKey == 'crypto_usd' ? '' : cryptoFocusNode.unfocus();
    clearKey == 'cardValue' ? '' : cardValueErrorBool = false;
    clearKey == 'cardValue' ? '' : cardValueFocusNode.unfocus();
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




  List <Map<String,dynamic>> cryptoList =[
    {
      "name":"Bitcoin",'icon':"bitcoin"
    },
    {
      "name":"Etherum",'icon':"bitcoin"
    }
    ,
    {
      "name":"Binance",'icon':"bitcoin"
    },
    {
      "name":"ebay",'icon':"bitcoin"
    },
    {
      "name":"Nike",'icon':"bitcoin"
    },
    
    {
      "name":"Binance",'icon':"bitcoin"
    },
    {
      "name":"ebay",'icon':"bitcoin"
    },
    {
      "name":"Nike",'icon':"bitcoin"
    },
  
  ];

    List <Map<String,dynamic>> giftCardList =[
    {
      "name":"Amazon",'icon':"amazon"
    },
    {
      "name":"Amazon",'icon':"amazon"
    },
    {
      "name":"Amazon",'icon':"amazon"
    },
    {
      "name":"ebay",'icon':"amazon"
    },
    {
      "name":"Nike",'icon':"amazon"
    },
  
  ];
}
