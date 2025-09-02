import 'package:favex/model/utilities/imports/shared.dart';

class GiftCardCaculatorVieModel extends BaseModel {
  // ========== STATE ==========
  int? selectedCountryIndex;
  int? selectedGiftCardIndex;
  int? selectedCardRangeIndex;
  int? selectedCardRecieptIndex;
  int? selectedCardValueIndex;
  String giftCardGeneralErrorText = '';
  bool selectedOtherCardValue=false;

  List<Country> cardCountryList = [];

  List<String> cardValueList = [];

  List<GiftCard> allGiftcards = [];

  List<GiftCard> giftCardLists = [];
  List<String> cardRangeList = [];
  List<String> cardReciptList = [];
  

  // ========== SERVICES ==========
  Future<void> fetchGiftcardsFunction(BuildContext context) async {
    setLoading(true);
    String? token = await LocalStorage.getToken();
    await runFunctionForApi(
      context,
      functionToRunService: networkService.getRequest(
        context,
        getGiftCardListUrl, // adjust route if needed
        (data) {
          return data;
        }, // return raw data
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        if (response.success) {
          // ✅ Giftcards inside response.data[0]["data"]
          final List<dynamic> giftcards = response.data[0]["data"] ?? [];

          print("Fetched giftcards: $giftcards");
          allGiftcards = giftcards.map((e) => GiftCard.fromJson(e)).toList();
          giftCardLists = giftcards.map((e) => GiftCard.fromJson(e)).toList();

          notifyListeners();

          snackBarWidget(
            context,
            text: textBucket!.giftcardsFetchedSuccessfully,
            title: textBucket!.giftCard,
          );
          setLoading(false);
        } else {
          snackBarWidget(
            context,
            text: response.error.toString(),
            title: "Error",
          );
          setLoading(false);
        }
      },
    );
    setLoading(false);
  }

  void setSelectedGiftCardIndex(int index) {
    selectedGiftCardIndex = index;
    cardCountryList = giftCardLists
        .where((card) => card.id == index)
        .first
        .countries; // extract the country field
    // reset selection
    selectedCountryIndex = null;
    selectedCardRangeIndex = null;
    selectedCardRecieptIndex = null;
    selectedCardValueIndex = null;
      selectedOtherCardValue=false;

    notifyListeners();
  }

  void setSelectedCountryIndex(int index) {
    selectedCountryIndex = index;

    cardRangeList = cardCountryList[index]
        .ranges
        .map((r) => "${r.min} - ${r.max} ")
        .toList();

    // reset selection

    selectedCardRangeIndex = null;
    selectedCardRecieptIndex = null;
    selectedCardValueIndex = null;
    selectedOtherCardValue=false;

    notifyListeners();
  }

  void setSelectedCardRangeIndex(int index) {
    selectedCardRangeIndex = index;

    final range = cardCountryList[selectedCountryIndex!].ranges[index];

    cardReciptList = range.receiptCategories.map((r) => r.title).toList();

    selectedCardRecieptIndex = null;
    selectedCardValueIndex = null;
    selectedOtherCardValue=false;

    notifyListeners();
    if (selectedCardRangeIndex != null && cardRangeList.isNotEmpty) {
      cardValueList =
          generateGiftCardSteps(cardRangeList[selectedCardRangeIndex!]);
    }
  }

  void setSelectedCardRecieptIndex(int index) {
    selectedCardRecieptIndex = index;
      selectedOtherCardValue=false;
    notifyListeners();
  }

  void setSelectedCardValueIndex(int index) {
         selectedCardValueIndex = index;
      if(index == cardValueList.length-1){
          selectedOtherCardValue =true;
      }
      else{
        selectedOtherCardValue=false;
   
        }
      notifyListeners();
    
  }

  void revalidateAllFields(BuildContext context) async {
    // Revalidate full name

    snackBarWidget(context,
        text: textBucket!.allFieldEntriesCorrect, title: textBucket!.okay);
  }

  String getSymbol() {
    return selectedCountryIndex != null && cardCountryList.isNotEmpty
        ? cardCountryList[selectedCountryIndex!].iso
        : '';
  }

  // calculate rate and total value
  String calculateRate() {
    String rate = "Nil";
    if (selectedCardRecieptIndex != null &&
        giftCardLists.isNotEmpty &&
        selectedCountryIndex != null &&
        selectedCardRangeIndex != null &&
        selectedGiftCardIndex != null) {
      rate = (giftCardLists
              .where((card) => card.id == selectedGiftCardIndex!)
              .first
              .countries[selectedCountryIndex!]
              .ranges[selectedCardRangeIndex!]
              .receiptCategories[selectedCardRecieptIndex!]
              .amount)
          .toString();
    }

    return rate;
  }

  String calculateTotalValue() {
    String totalValue = "Nil";
    String rate = calculateRate();

    if(selectedCardValueIndex == cardValueList.length-1 && cardValueController.text.trim().isEmpty){
        return totalValue;
    }

    if(selectedCardValueIndex == cardValueList.length-1 && cardValueController.text.trim().isNotEmpty){
      if(calculateRate() != 'Nil' &&
        selectedCardValueIndex != null &&
        cardValueList.isNotEmpty){}{
            totalValue = (double.parse(rate) *
              double.parse(cardValueController.text.trim().replaceAll(',', '')))
          .toString();
        }
    }
   else if (calculateRate() != 'Nil' &&
        selectedCardValueIndex != null &&
        cardValueList.isNotEmpty) {
      totalValue = (double.parse(rate) *
              double.parse(cardValueList[selectedCardValueIndex!]))
          .toString();
    }

    return totalValue;
  }

    validateCardValue() {
    unfocusAllNodes('cardValue');
    if(selectedCardRangeIndex==null){return;}
    else if (selectedCardRangeIndex!=null && cardValueController.text.trim().isNotEmpty ){
     int min= int.parse(cardCountryList[selectedCountryIndex!].ranges[selectedCardRangeIndex!].min);
     int max= int.parse(cardCountryList[selectedCountryIndex!].ranges[selectedCardRangeIndex!].max);

     int value = int.parse(cardValueController.text.trim().replaceAll(',', ''));
     print(value);
    
    if (min<=value && max>=value) {
      cardValueErrorBool = false;
      cardValueErrorText = '';
      cardValueNotValid = false;
      calculateTotalValue();
      notifyListeners();
    } else {
      cardValueErrorBool = true;
      cardValueErrorText =
         "${textBucket!.cardValueRange} ${displayWithComma (min.toString())}  and ${displayWithComma (max.toString())}" ;
      cardValueNotValid = true;
      notifyListeners();
    }}
  }

  onChangedCardValue() {
    cardValueFocusNode.addListener(() {
      if (cardValueFocusNode.hasFocus == false) {
        cardValueErrorBool = false;
        notifyListeners();
      }
    });
    validateCardValue();
  }
}
