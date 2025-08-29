import '/model/utilities/imports/shared.dart';

class HomeViewModel extends BaseModel{

  bool showBalance = true;

  switchBalanceVisibility(){
    showBalance = !showBalance;
    notifyListeners();
  }

  // quick action list

  List<Map<String, dynamic>> quickActions =[

    {"name":textBucket!.tradeGiftcard,"icon":"trade_giftcard"},
    {"name":textBucket!.tradeCrypto,"icon":"trade_crypto"},
    {"name":textBucket!.payBills,"icon":"pay_bills"},
    {"name":textBucket!.tasks,"icon":"task"},
    {"name":textBucket!.rewards,"icon":"reward"},
    {"name":textBucket!.more,"icon":"more"},


  ];

  WalletTypeEnum selectedWallet = WalletTypeEnum.wallet;

  switchWalletBalance(WalletTypeEnum wallet ){
      selectedWallet = wallet;
      notifyListeners();
    

  }
  
}