import '/model/utilities/imports/shared.dart';

class HomeViewModel extends BaseModel{

  bool showBalance = true;

  switchBalanceVisibility(){
    showBalance = !showBalance;
    notifyListeners();
  }

  // quick action list

  List<Map<String, dynamic>> quickActions =[

    {"name":textBucket!.tradeGiftcard,"icon":"trade_giftcard","navigateTo":sellGiftCardPageRoute},
    {"name":textBucket!.tradeCrypto,"icon":"trade_crypto","navigateTo":sellCrytoCurrencyPageRoute},
    {"name":textBucket!.payBills,"icon":"pay_bills","navigateTo":homePageRoute},
    {"name":textBucket!.tasks,"icon":"task","navigateTo":homePageRoute},
    {"name":textBucket!.rewards,"icon":"reward","navigateTo":homePageRoute},
    {"name":textBucket!.more,"icon":"more","navigateTo":homePageRoute},


  ];

  WalletTypeEnum selectedWallet = WalletTypeEnum.wallet;

  switchWalletBalance(WalletTypeEnum wallet ){
      selectedWallet = wallet;
      notifyListeners();
    

  }
  
}