import 'package:favex/model/utilities/imports/shared.dart';

class GiftCardCaculatorVieModel extends BaseModel {
  // ========== STATE ==========
  int? selectedCountryIndex;
  int? selectedGiftCardIndex;
  int? selectedCardRangeIndex;
  int? selectedCardRecieptIndex;
  int? selectedCardValueIndex;
  String giftCardGeneralErrorText = '';

  List<Map<String, dynamic>> cardCountryList = [
    {"name": "UK", "icon": "uk", "iso": "GB","currency":"£"},
    {"name": "USA", "icon": "usa", "iso": "US","currency":"\$"},
    {"name": "Canada", "icon": "canada", "iso": "CA","currency":"\$"},
    {"name": "Others", "icon": "arrow_right", "iso": "others","currency":""},
  ];

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

          notifyListeners();

          snackBarWidget(
            context,
            text: "Giftcards fetched successfully",
            title: "Giftcards",
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

  void setSelectedCountryIndex(int index) {
    selectedCountryIndex = index;
    final iso = cardCountryList[index]['iso'];

    print(iso);

    if (iso == "others") {
      giftCardLists = giftCardLists.where((g) {
        return g.countries.any((c) {
          final cIso = c.iso;
          return !(cIso == "GB" || cIso == "US" || cIso == "CA");
        });
      }).toList();
    } else {
      giftCardLists = allGiftcards.where((g) {
        return g.countries.any((c) => c.iso == iso);
      }).toList();
    }

    // reset selection
    selectedGiftCardIndex = null;
    selectedCardRangeIndex = null;
    selectedCardRecieptIndex = null;
    selectedCardValueIndex = null;

    notifyListeners();
  }

  void setSelectedGiftCardIndex(int index) {
    selectedGiftCardIndex = index;
    final iso = cardCountryList[selectedCountryIndex!]['iso'];
    final giftcard = giftCardLists[index];

    final country = giftcard.countries.firstWhere(
      (c) => iso == "others"
          ? !(c.iso == "GB" || c.iso == "US" || c.iso == "CA")
          : c.iso == iso,
    );

    cardRangeList = country.ranges.map((r) => "${r.min} - ${r.max} ").toList();
    selectedCardRangeIndex = null;

    notifyListeners();
  }

  void setSelectedCardRangeIndex(int index) {
    selectedCardRangeIndex = index;

    final giftcard = giftCardLists[selectedGiftCardIndex!];
    final iso = cardCountryList[selectedCountryIndex!]['iso'];

    final country = giftcard.countries.firstWhere(
      (c) => iso == "others"
          ? !(c.iso == "GB" || c.iso == "US" || c.iso == "CA")
          : c.iso == iso,
    );

    final range = country.ranges[index];

    cardReciptList = range.receiptCategories.map((r) => r.title).toList();

    selectedCardRecieptIndex = null;
    selectedCardValueIndex = null;

    notifyListeners();
    if (selectedCardRangeIndex != null && cardRangeList.isNotEmpty) {
      cardValueList =
          generateGiftCardSteps(cardRangeList[selectedCardRangeIndex!]);
    }
  }

  void setSelectedCardRecieptIndex(int index) {
    selectedCardRecieptIndex = index;

    notifyListeners();
  }

  void setSelectedCardValueIndex(int index) {
    selectedCardValueIndex = index;
    notifyListeners();
  }

  void revalidateAllFields(BuildContext context) async {
    // Revalidate full name

    snackBarWidget(context,
        text: textBucket!.allFieldEntriesCorrect, title: textBucket!.okay);
  }

  String getSymbol(){
     return selectedCountryIndex!=null && cardCountryList.isNotEmpty ?cardCountryList[selectedCountryIndex!]['currency']:'';
  }

  // calculate rate and total value
  String calculateRate() {
    String rate = "Nil";
    if (selectedCardRecieptIndex != null &&
        giftCardLists.isNotEmpty &&
        selectedCountryIndex != null &&
        selectedCardRangeIndex != null &&
        selectedGiftCardIndex != null ) {
      rate = (giftCardLists[selectedGiftCardIndex!]
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
    if (calculateRate() != 'Nil' &&
        selectedCardValueIndex != null &&
        cardValueList.isNotEmpty) {
      totalValue = (double.parse(rate) *
              double.parse(cardValueList[selectedCardValueIndex!]))
          .toString();
    }

    return totalValue;
  }

  
}
