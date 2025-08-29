import '/model/utilities/imports/view_models.dart';

class SellGiftCardViewModel extends BaseModel{


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

  List <Map<String,dynamic>> filteredGiftCardList = []; // Filtered list

  SellGiftCardViewModel() {
    // Initialize with some gift cards
   
    filteredGiftCardList = List.from(giftCardList); // Initialize filtered list
    searchController.addListener(_filterGiftCards);
  }

  void _filterGiftCards() {
    final query = searchController.text.toLowerCase();
    filteredGiftCardList = giftCardList
        .where((giftCard) => giftCard['name'].toLowerCase().contains(query))
        .toList();
    notifyListeners(); // Notify listeners to rebuild UI
  }

}