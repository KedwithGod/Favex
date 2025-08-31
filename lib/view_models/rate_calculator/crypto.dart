
import 'package:favex/model/utilities/imports/shared.dart';

class CryptoVieweModel extends BaseModel{

  
  String cryptoGeneralErrorText = '';
  String giftCardGeneralErrorText = '';

  
  int? selectedCryptoIndex;

  setSelectedCryptoIndex(int index){
    selectedCryptoIndex = index;
    cryptoGeneralErrorText = '';
    notifyListeners();
  }

 
  validateUSDAmount() {
    unfocusAllNodes('crypto_usd');
   
    if (cryptoController.text.trim().isEmpty || double.parse(cryptoController.text.trim().replaceAll(',', ''))<=0) {
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

  List<CryptoModel> cryptoLists =[];

  Future<void> fetchCryptoDataFunction(BuildContext context) async {
    setLoading(true);
    String? token = await LocalStorage.getToken();
    await runFunctionForApi(
      context,
      functionToRunService: networkService.getRequest(
        context,
        getCryptoDataUrl, // adjust route if needed
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
          final List<dynamic> cryptolisting = response.data[0]["data"] ?? [];

         
          cryptoLists = cryptolisting.map((e) => CryptoModel.fromJson(e)).toList();

          notifyListeners();

          snackBarWidget(
            context,
            text: textBucket!.cryptoFetchedSuccessfully,
            title: textBucket!.crypto,
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


  // calculate rate

    // Public getter
  String get rate => _calculateRate();
  String get totalValue => _calculateTotalValue();

  String _calculateRate(){

      String rate ='Nil';
      if(selectedCryptoIndex!=null && cryptoLists.isNotEmpty){
        rate = cryptoLists[selectedCryptoIndex!].nairaRate.toString();
      }
      return rate;
  }
  String _calculateTotalValue(){

      String totalValue ='Nil';
    
      if(selectedCryptoIndex!=null && cryptoLists.isNotEmpty && rate !='Nil' && cryptoController.text.trim().isNotEmpty){
        totalValue = (double.parse(rate) * double.parse(cryptoController.text.trim().replaceAll(',', ''))).toString();
      }
      return totalValue;
  }

}