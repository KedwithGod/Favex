import '/model/utilities/imports/shared.dart';

class RateCalculatorViewModel extends BaseModel{

  RateCalculatorTabEnum selectedTab = RateCalculatorTabEnum.crypto;

  List <Map<String,dynamic>> rateTabList =[
    {
      "name": textBucket!.GiftCard, 'enum': RateCalculatorTabEnum.gift
    },
    {
      "name": textBucket!.crypto, 'enum': RateCalculatorTabEnum.crypto
    },
  ];

  String cryptoGeneralErrorText = '';

  switchTab(RateCalculatorTabEnum tab){
    selectedTab = tab;
    notifyListeners();
  }


  int? selectedCryptoIndex;

  setSelectedCryptoIndex(int index){
    selectedCryptoIndex = index;
    cryptoGeneralErrorText = '';
    notifyListeners();
  }

  validateUSDAmount() {
    unfocusAllNodes('crypto_usd');
   
    if (cryptoController.text.trim().isEmpty || double.parse(cryptoController.text.trim())<=0) {
      cryptoErrorBool = true;
      cryptoErrorText = textBucket!.amountInUsdMustBeGreaterThanZero;
      cryptoNotValid = true;
      notifyListeners();
    } else {
      cryptoErrorBool = false;
      cryptoErrorText = '';
    
      cryptoNotValid = false;
      notifyListeners();
    }
  }

  // change crypto function
  onChangedCryptoUSD() {
    cryptoFocusNode.addListener(() {
      if (cryptoFocusNode.hasFocus == false) {
        cryptoErrorBool = false;
        cryptoGeneralErrorText = '';
        notifyListeners();
      }
    });
    validateUSDAmount();
  }

  void revalidateAllFields(BuildContext context) async {
    // Revalidate full name

    if (cryptoNotValid == true) {
      validateUSDAmount();
    } else if (selectedCryptoIndex == null) {
        cryptoGeneralErrorText =  textBucket!.selectACryptoToContinue;
        notifyListeners();
    }
    // If all fields are valid, store them in signUpBucket
    else {
      snackBarWidget(context, text: textBucket!.allFieldEntriesCorrect, title: textBucket!.okay);
    }
  }

}