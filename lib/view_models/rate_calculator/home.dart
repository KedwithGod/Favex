import '/model/utilities/imports/shared.dart';

class RateCalculatorViewModel extends BaseModel{

  RateCalculatorTabEnum selectedTab = RateCalculatorTabEnum.gift;

  List <Map<String,dynamic>> rateTabList =[
    {
      "name": textBucket!.giftCard, 'enum': RateCalculatorTabEnum.gift
    },
    {
      "name": textBucket!.crypto, 'enum': RateCalculatorTabEnum.crypto
    },
  ];




 


  switchTab(RateCalculatorTabEnum tab){
    selectedTab = tab;
    notifyListeners();
  }






}