




import '/model/utilities/imports/shared.dart';

class GiftCardRate extends StatelessWidget {
  const GiftCardRate({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RateCalculatorViewModel>.reactive(
        viewModelBuilder: () => RateCalculatorViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return S(
            h: 748,
            w: 335,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // heading
                  Row(
                    children: [
                      InterText(
                        textBucket!.checkCurrentRatesForGiftCard,
                        textColor: colorsBucket!.subtitle,
                        textFontSize: 12,
                      ),
                    ],
                  ),

                  // crypto field
                  S(h: 24),
                  Row(
                    children: [
                      InterText(
                        textBucket!.crypto,
                        textFontSize: 12,
                      ),
                    ],
                  ),
                  S(h: 10),
                  GestureDetector(
                    onTap: () {
                      GeneralBottomSheet.show(context,
                          content: CryptoSelectorBottomSheet(
                            cryptoList: model.cryptoList,
                            selectText: textBucket!.selectCrypto, // Title text
                            searchHint:
                                textBucket!.searchCoin, // Search field hint
                            onSelect: (index) {
                              model.setSelectedCryptoIndex(index);
                              // Perform any additional actions needed
                            },
                          ));
                    },
                    child: GeneralContainer(
                      height: 56,
                      width: 335,
                      color: colorsBucket!.backgroundMid,
                      left: 14,
                      right: 15,
                      borderRadius: 16,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(model.selectedCryptoIndex == null
                              ? textBucket!.chooseCrypto
                              : model.cryptoList[model.selectedCryptoIndex!]
                                  ['name']),
                          S(
                            h: 13,
                            w: 13,
                            child: const SvgPngImage(
                                path: 'arrow_down', height: 11, width: 8),
                          )
                        ],
                      ),
                    ),
                  ),

                  S(h: 24),
                  Row(
                    children: [
                      InterText(
                        "${textBucket!.amountIn} ${model.usd}",
                        textFontSize: 12,
                      ),
                    ],
                  ),
                  S(h: 10),
                  FormattedTextFields(
                    textFieldController: model.cryptoController,
                    textFieldHint: textBucket!.enterAmount,
                    onChangedFunction: (value) {
                      model.onChangedCryptoUSD();
                    },
                    errorTextActive: model.cryptoErrorBool,
                    focusNode: model.cryptoFocusNode,
                    errorText: model.cryptoErrorText,
                    containerColor: colorsBucket!.borderDisabled,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ThousandsSeparatorInputFormatter()
                    ],
                    prefix: InterText('\S'),
                    suffixIcon: model.cryptoNotValid == true
                        ? S()
                        : S(
                            h: 56,
                            w: 40,
                            child: Row(
                              children: [
                                S(w: 10),
                                const SvgPngImage(
                                    path: 'check', height: 16, width: 16),
                                S(w: 5),
                              ],
                            ),
                          ),
                  ),

                  // rate details
                  S(h: 24),

                  GeneralContainer(
                    color: colorsBucket!.backgroundMid,
                    left: 14,
                    right: 21,
                    top: 25,
                    bottom: 25,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              textBucket!.rate,
                              textFontSize: 12,
                            ),
                            InterText(
                              "${model.nairaSymbol}1500",
                              textFontSize: 12,
                            ),
                          ],
                        ),
                        S(h: 20),
                        const DividerWidget(),
                        S(h: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              textBucket!.totalValue,
                              textFontSize: 12,
                            ),
                            InterText(
                              "${model.nairaSymbol}${displayWithComma('104000')}}",
                              textFontSize: 12,
                            ),
                          ],
                        ),
                        S(h: 60),
                        if (model.cryptoGeneralErrorText != '') ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              S(h: 5),
                              S(
                                h: calculateErrorTextHeight(
                                    model.cryptoGeneralErrorText , context),
                                w: 335,
                                child: InterText(model.cryptoGeneralErrorText ,
                                    textColor: colorsBucket!.alertHard,
                                    noOfTextLine: 6,
                                    textFontSize: 12,
                                    textAlign: TextAlign.left),
                              ),
                              S(h: 4),
                            ],
                          )
                        ],
                        buttonNoPositioned(context,
                            text: textBucket!.tradeCrypto,
                            textColor: model.cryptoNotValid &&
                                    model.selectedCryptoIndex == null
                                ? colorsBucket!.subtitle
                                : colorsBucket!.titleSoft,
                            buttonColor: model.cryptoNotValid &&
                                    model.selectedCryptoIndex == null
                                ? colorsBucket!.disabled
                                : colorsBucket!.primary, navigator: () {
                          model.revalidateAllFields(context);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
