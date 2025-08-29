import 'package:favex/model/utilities/imports/shared.dart';

class SellCryptoViewModel extends BaseModel{



  List <Map<String,dynamic>> filteredCryptoList = []; // Filtered list

  SellCryptoViewModel() {
    // Initialize with some gift cards
   
    filteredCryptoList = List.from(cryptoList); // Initialize filtered list
    searchController.addListener(_filterCrptoList);
  }

  void _filterCrptoList() {
    final query = searchController.text.toLowerCase();
    filteredCryptoList = cryptoList
        .where((giftCard) => giftCard['name'].toLowerCase().contains(query))
        .toList();
    notifyListeners(); // Notify listeners to rebuild UI
  }
}