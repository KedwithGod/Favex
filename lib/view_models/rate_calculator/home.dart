import '/model/utilities/imports/shared.dart';

class RateCalculatorViewModel extends BaseModel{

  RateCalculatorTabEnum selectedTab = RateCalculatorTabEnum.gift;

  List <Map<String,dynamic>> rateTabList =[
    {
      "name": textBucket!.GiftCard, 'enum': RateCalculatorTabEnum.gift
    },
    {
      "name": textBucket!.crypto, 'enum': RateCalculatorTabEnum.crypto
    },
  ];

  List <Map<String,dynamic>> cardCountryList =[
    {
      "name":"UK", 'icon':"uk",
    },
    {
      "name":"USA", 'icon':"usa",
    },
    {
      "name":"Canada", 'icon':"canada",
    },
    {
      "name":textBucket!.otherCountries, 'icon':"arrow_right",
    },
  ];
  List <String> cardRangeList =[
   "100-200", "201-300", "301-400", "401-500"
  ];
  List <String> cardReciptList =[
   textBucket!.cashReceipt, textBucket!.DebitReceipt, textBucket!.noReceipt, textBucket!.eCode
  ];

   List <String> cardValueList =[
   "100", "150", "200", "others"
  ];


  int? selectedCardValueIndex;

  setSelectedCardValueIndex(int index){
    selectedCardValueIndex = index;
    notifyListeners();
  }

  int? selectedCardRecieptIndex;

  setSelectedCardRecieptIndex(int index){
    selectedCardRecieptIndex = index;
    notifyListeners();
  }
  int? selectedCardRangeIndex;

  setSelectedCardRangeIndex(int index){
    selectedCardRangeIndex = index;
    notifyListeners();
  }

  int selectedCountryIndex = 1;

  setSelectedCountryIndex(int index){
    selectedCountryIndex = index;
    notifyListeners();
  }

  String cryptoGeneralErrorText = '';
  String giftCardGeneralErrorText = '';

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

  int? selectedGiftCardIndex;

  setSelectedGiftCardIndex(int index){
    selectedGiftCardIndex = index;
    giftCardGeneralErrorText ="";
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