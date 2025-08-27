

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
  if (language == null || language.isEmpty || !textMap.containsKey(language)) {
    textBucket = textMap["english"]!; // Default to English
  } else {
    textBucket = textMap[language]!;
  }
}

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer timer) {
      if (counter > 0) {
        counter--;
      } else {
        timer.cancel();
      }
    });
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




  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // otp variables
  TextEditingController? otpController;
  bool otpErrorBool = false;
  FocusNode otpFocusNode = FocusNode();
  FocusNode deleteButtonFocusNode = FocusNode();
  String otpValue = '';

  otpOnChangedFunction(int index, String value, {bool add = true}) {
    // save the value and move the cursor forward
    updateOtpValue(index, value, add);
    if (index + 1 <= 4) {
      currentIndex = index + 1;
    }
    debugPrint(otpValue);
  }

  // set texfield index
  int currentIndex = 0;
  setCurrentIndex(int index) {
    {
      if (otpController == null || otpController!.text.isEmpty) {
        otpController = TextEditingController();
      }
      currentIndex = index;
      otpFocusNode.notifyListeners();
    }
  }

  // update otpvalue
  updateOtpValue(int index, String value, bool add) {
    // Convert the string to a list of characters
    List<String> charList = otpValue.split('');

    // Add a value at a specific index (e.g., index 2)
    if (add == true) {
      charList.insert(index, value);
    }

    // Remove a value at a specific index (e.g., index 1)
    if (add == false) {
      charList.removeAt(index);
    }

    // Convert the list back to a string
    otpValue = charList.join('');
    // this allowed to notify listener
    otpFocusNode.notifyListeners();
  }






  // search field variable
  TextEditingController searchController = TextEditingController();
  bool searchErrorBool = false;
  FocusNode searchFocusNode = FocusNode();


  // validations for onChan
  // for showing error text under text fields
  showErrorText(
      {required String text,
      required bool errorBool,
      TextAlign textAlign = TextAlign.left,
      double lineLength = 1.0}) {
    if (errorBool == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          S(
            h: 10 * lineLength,
            w: 150,
            child: InterText(text, 
            textColor: colorsBucket!.alertHard,
            textFontSize: 6,
            noOfTextLine: 6,
                textAlign: textAlign),
          ),
          S(h: 4),
        ],
      );
    } else {
      return S();
    }
  }



}
