import '/model/utilities/imports/shared.dart';

class CreateAccountViewModel extends BaseModel {
  final List<Map<String, dynamic>> socialSources = [
    {'name': 'Facebook', "icon": "facebook_icon"},
    {"name": "Instagram", "icon": "instagram"},
    {"name": "Twitter", "icon": "twitter_icon"},
    {"name": "Google", "icon": "google_icon"},
    {"name": textBucket!.influencer, "icon": "influencer_icon"},
    {"name": textBucket!.others, "icon": "others_icon"}
  ];

  bool usernameIsAvailable = false;
  bool phoneIsAvailable = false;
  String fullPhoneNumber = '';

  int? selectedSourceIndex;

  setSourceIndex(int index) {
    selectedSourceIndex = index;
    notifyListeners();
    router.pop();
  }

  validateFirstName() {
    unfocusAllNodes('firstName');
    if (firstNameController.text.length <= 2) {
      firstNameErrorBool = true;
      firstNameErrorText = textBucket!.firstNameValidity;
      firstNameNotValid = true;
    } else {
      firstNameErrorBool = false;
      firstNameErrorText = "";
      firstNameNotValid = false;
    }
    notifyListeners();
  }

  validateLastName() {
    unfocusAllNodes('lastName');
    if (lastNameController.text.length <= 2) {
      lastNameErrorBool = true;
      lastNameErrorText = textBucket!.lastNameMinLength;
      lastNameNotValid = true;
    } else {
      lastNameErrorBool = false;
      lastNameErrorText = "";
      lastNameNotValid = false;
    }
    notifyListeners();
  }

  validateUsername() {
    unfocusAllNodes('username');
    final username = usernameController.text.trim();

    // Check if it starts with a letter
    if (!RegExp(r'^[A-Za-z]').hasMatch(username)) {
      usernameErrorBool = true;
      usernameErrorText = textBucket!.usernameMustStartWithALetter;
      usernameNotValid = true;
    }

    // Check if username is longer than 3 characters
    else if (username.length <= 3) {
      usernameErrorBool = true;
      usernameErrorText = textBucket!.usernameMinLength;
      usernameNotValid = true;
    } else {
      usernameErrorBool = false;
      usernameErrorText = "";
      usernameNotValid = false;
    }

    notifyListeners();
  }

  // validate phone
  Future<void> validatePhone() async {
    unfocusAllNodes('phone');

    String rawInput = phonenumberController.text.trim();

    bool isValid = false;

    // --- MOBILE & WEB (use plugin validation) ---
    // if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
    //   try {
    //     PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(
    //       rawInput,
    //       'NG',
    //     );
    //     isValid = true;
    //   } catch (e) {
    //     isValid = false;
    //   }
    // } else {
    // --- DESKTOP (manual validation) ---
    // For Nigeria: must start with 0 or +234 and length between 10–14
    String cleaned = rawInput.replaceAll(RegExp(r'\D'), ''); // keep only digits
    if (cleaned.startsWith("234")) {
      isValid = cleaned.length == 10;
    } else if (cleaned.startsWith("0")) {
      isValid = cleaned.length == 11;
    } else {
      isValid = cleaned.length >= 7 && cleaned.length <= 12;
    }
    // }
    print(isValid);
    notifyListeners();
    if (isValid) {
      phonenumberErrorBool = false;
      phoneErrorText = "";
      phoneNotValid = false;
    } else {
      phonenumberErrorBool = true;
      phoneErrorText = textBucket!.pleaseEnterValidPhoneNumber;
      phoneNotValid = true;
    }

    notifyListeners();
  }

// name onchanged function
  onChangedFunctionFirstName() {
    firstNameFocusNode.addListener(() {
      if (!firstNameFocusNode.hasFocus) {
        firstNameErrorBool = false;
        notifyListeners();
      }
    });
    validateFirstName();

    notifyListeners();
  }

// name onchanged function
  onChangedFunctionLastName() {
    lastNameFocusNode.addListener(() {
      if (!lastNameFocusNode.hasFocus) {
        lastNameErrorBool = false;
        notifyListeners();
      }
    });
    validateLastName();

    notifyListeners();
  }

// username onchanged function
  onChangedFunctionUsername() {
    usernameIsAvailable = false;
    usernameFocusNode.addListener(() {
      if (!usernameFocusNode.hasFocus) {
        usernameErrorBool = false;
        notifyListeners();
      }
    });
    validateUsername();

    notifyListeners();
  }

// phone onchanged function
  onChangedFunctionPhone(PhoneNumber value) {
    phoneIsAvailable = false;

    fullPhoneNumber = value.phoneNumber.toString();
    phonenumberFocusNode.addListener(() {
      if (!phonenumberFocusNode.hasFocus) {
        phonenumberErrorBool = false;
        notifyListeners();
      }
    });
    // validate phone number

    validatePhone();
    notifyListeners();
  }

  // referraltag onchanged function
  onChangedFunctionReferralTag() {
    referralTagFocusNode.addListener(() {
      if (!referralTagFocusNode.hasFocus) {
        referralTagErrorBool = false;
        notifyListeners();
      }
    });
    validateReferralTag();

    notifyListeners();
  }

  validateReferralTag() {
    unfocusAllNodes('referralTag');
    // provide function to valide if referral tag is valid
    referralTagErrorBool = false;
    referralTagErrorText = "";
    referralTagNotValid = false;

    notifyListeners();
  }

  bool allFieldsAreValid() {
    return !firstNameNotValid &&
        !lastNameNotValid &&
        !usernameNotValid &&
        !phoneNotValid &&
        phoneIsAvailable == true &&
        usernameIsAvailable == true;
  }

  void revalidateAllFields(BuildContext context) async {
    // Revalidate full name

    if (firstNameNotValid == true) {
      validateFirstName();
    } else if (lastNameNotValid == true) {
      validateLastName();
    } else if (usernameNotValid == true) {
      validateUsername();
    } else if (usernameIsAvailable == false) {
      validateUsernameFunction(context);
    } else if (phoneNotValid == true) {
      validatePhone();
    } else if (phoneIsAvailable == false) {
      validatePhoneNumberFunction(context);
    } else if (referralTagNotValid == true) {
      validateReferralTag();
    } else {
      // save values into create account bucket
      signUpdatabucket = User.fromJson({
        'id': 0,
        "first_name": firstNameController.text.trim(),
        "last_name": lastNameController.text.trim(),
        "username": usernameController.text.trim(),
        "email": emailControllerBucket,
        "phone": fullPhoneNumber,
      });

      print(signUpdatabucket!.toJson());
      whereYouFindUsBucket = (selectedSourceIndex != null
          ? socialSources[selectedSourceIndex!]['name']
          : "");
      referralTagBucket = referralTagController.text.trim();
      router.goNamed(createPasswordPageRoute);
    }
  }

  Future<void> validateUsernameFunction(BuildContext context) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        validateUsernameUrl, // e.g. "/v1/validate/username"
        {
          "username": usernameController.text.trim(),
        },
        (data) => data, // return raw response map
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        final Map<String, dynamic> jsonData = response.data[0];

        if (response.success) {
          usernameIsAvailable = true;
          notifyListeners();
          snackBarWidget(
            context,
            text: jsonData["message"] ?? textBucket!.usernameIsAvailable,
          );
        } else {
          snackBarWidget(
            context,
            text: response.error.toString(),
            title: textBucket!.validationFailed,
          );
        }
      },
    );
  }

  Future<void> validatePhoneNumberFunction(
    BuildContext context,
  ) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        validatePhoneUrl, // e.g. "/v1/validate/phone"
        {
          "phone": fullPhoneNumber,
        },
        (data) => data, // raw response map
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        final Map<String, dynamic> jsonData = response.data[0];

        if (response.success) {
          phoneIsAvailable = true;
          notifyListeners();
          snackBarWidget(
            context,
            text: jsonData["message"] ?? textBucket!.phoneNumberIsValid,
          );
        } else {
          snackBarWidget(
            context,
            text: response.error.toString(),
            title: textBucket!.validationFailed,
          );
        }
      },
    );
  }
}
