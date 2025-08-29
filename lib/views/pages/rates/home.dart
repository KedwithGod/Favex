

import '/model/utilities/imports/shared.dart';

class RateCalculatorPage extends StatelessWidget {
  const RateCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RateCalculatorViewModel>.reactive(
        viewModelBuilder: () => RateCalculatorViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(
            bottomNavigationBar: pageTab(context, tabEnum: TabEnum.rate),
            children: [
              rowPositioned(
                  top: 0,
                  bottom: 20,
                  child: S(
                    h: 748,
                    w: 335,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // heading
                          Row(
                            children: [
                              InterText(
                                textBucket!.rateCalculator,
                                textFontSize: 16,
                                textFontWeight: FontWeight.w600,
                              ),
                            ],
                          ),

                          //  tab
                          S(h: 32),
                          GeneralContainer(
                            color: colorsBucket!.backgroundMid,
                            left: 7,
                            right: 10,
                            top: 10,
                            bottom: 10,
                            child: Row(
                              children: [
                                ...List.generate(model.rateTabList.length,
                                    (index) {
                                  return GestureDetector(
                                    onTap: (){
                                      model.switchTab(model.rateTabList[index]['enum']);
                                    },
                                    child: GeneralContainer(
                                      color: model.selectedTab ==
                                              model.rateTabList[index]['enum']
                                          ? colorsBucket!.primary
                                          : colorsBucket!.transparent,
                                      left: 50,
                                      right: 50,
                                      top: 10,
                                      bottom: 10,
                                      borderRadius: 8,
                                      child: InterText(
                                        model.rateTabList[index]['name'],
                                        textColor: model.selectedTab ==
                                                model.rateTabList[index]['enum']
                                            ? colorsBucket!.titleSoft
                                            : colorsBucket!.title,
                                        textFontSize: 12,
                                        textFontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                })
                                // gift card
                                // crypto
                              ],
                            ),
                          ),

                        S(h:12),
                          // decide what page to show

                          // if(model.selectedTab == RateCalculatorTabEnum.gift)...[
                          // const  GiftCardRate()
                          // ],

                          if(model.selectedTab == RateCalculatorTabEnum.crypto)...[
                          const  CryptoRatePage()
                          ]
                        ],
                      ),
                    ),
                  )),
            ],
          );
        });
  }
}
