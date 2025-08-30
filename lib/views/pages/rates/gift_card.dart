import '/model/utilities/imports/shared.dart';

class GiftCardRate extends StatelessWidget {
  const GiftCardRate({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GiftCardCaculatorVieModel>.reactive(
        viewModelBuilder: () => GiftCardCaculatorVieModel(),
        onViewModelReady: (model) async {
          await model.fetchGiftcardsFunction(context);
        },
        builder: (context, model, child) {
          return model.isLoading
              ? const ShimmerLoader()
              : model.allGiftcards.isEmpty
                  ? InterText(textBucket!.noGiftCardDataFound)
                  : Column(
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

                        // card county
                        S(h: 20),
                        Row(
                          children: [
                            InterText(
                              textBucket!.selectCardCountry,
                              textFontSize: 12,
                            ),
                          ],
                        ),

                        S(h: 10),

                        Row(
                          // spacing: sS(context).cW(width: 10),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(model.cardCountryList.length,
                                (index) {
                              return GestureDetector(
                                onTap: () {
                                  model.setSelectedCountryIndex(index);
                                },
                                child: GeneralContainer(
                                  color: model.selectedCountryIndex == index
                                      ? colorsBucket!.primaryLemon
                                      : colorsBucket!.transparent,
                                  borderRadius: 16,
                                  allSide: 8,
                                  borderColor:
                                      model.selectedCountryIndex == index
                                          ? colorsBucket!.primary
                                          : colorsBucket!.borderDisabled,
                                  child: S(
                                    h: 60,
                                    w: 50,
                                    child: Column(
                                      children: [
                                        SvgPngImage(
                                          path: model.cardCountryList[index]
                                              ['icon'],
                                          height: index ==
                                                  model.cardCountryList.length -
                                                      1
                                              ? 24
                                              : 36,
                                          width: index ==
                                                  model.cardCountryList.length -
                                                      1
                                              ? 24
                                              : 36,
                                        ),
                                        S(h: 5),
                                        InterText(
                                          model.cardCountryList[index]['name'],
                                          textColor: colorsBucket!.subtitle,
                                          textFontSize: 10,
                                          noOfTextLine: 2,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),

                        // gift card field
                        S(h: 24),
                        Row(
                          children: [
                            InterText(
                              textBucket!.GiftCard,
                              textFontSize: 12,
                            ),
                          ],
                        ),
                        S(h: 10),
                        GestureDetector(
                          onTap: () {
                            GeneralBottomSheet.show(context,
                                content: CryptoSelectorBottomSheet(
                                  cryptoList: model.giftCardLists,
                                  imagetype: ImageTypeEnum.svg,
                                  selectText:
                                      textBucket!.chooseGiftcard, // Title text
                                  searchHint: textBucket!
                                      .searchCard, // Search field hint
                                  onSelect: (index) {
                                    model.setSelectedGiftCardIndex(index);
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
                                InterText(model.selectedGiftCardIndex == null
                                    ? textBucket!.chooseGiftcard
                                    : model
                                        .giftCardLists[
                                            model.selectedGiftCardIndex!]
                                        .title),
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

                        // card range
                        Row(
                          children: [
                            InterText(
                              textBucket!.cardRange,
                              textFontSize: 12,
                            ),
                          ],
                        ),
                        S(h: 10),
                        GestureDetector(
                          onTap: () {
                            GeneralBottomSheet.show(context,
                                content: GeneralContainer(
                                  width: 375,
                                  height: 90.0 * model.cardRangeList.length,
                                  color: colorsBucket!.white,
                                  allSide: 10,
                                  child: Column(
                                    spacing: sS(context).cH(height: 10),
                                    children: [
                                      InterText(textBucket!.selectCardRange),
                                      ...List.generate(
                                          model.cardRangeList.length, (index) {
                                        return GestureDetector(
                                            onTap: () {
                                              model.setSelectedCardRangeIndex(
                                                  index);
                                              context.pop();
                                            },
                                            child: GeneralContainer(
                                              width: 335,
                                              height: 50,
                                              allSide: 10,
                                              color:
                                                  model.selectedCardRangeIndex ==
                                                          index
                                                      ? colorsBucket!
                                                          .primaryLemon
                                                      : colorsBucket!
                                                          .backgroundMid,
                                              child: Center(
                                                child: InterText(
                                                    model.cardRangeList[index]),
                                              ),
                                            ));
                                      })
                                    ],
                                  ),
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
                                InterText(model.selectedCardRangeIndex == null
                                    ? textBucket!.chooseCardRange
                                    : model.cardRangeList[
                                        model.selectedCardRangeIndex!]),
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

                        // card receipt category
                        Row(
                          children: [
                            InterText(
                              textBucket!.cardReceiptCategory,
                              textFontSize: 12,
                            ),
                          ],
                        ),
                        S(h: 10),

                        S(
                          w: 335,
                          h: 92,
                          child: Wrap(
                            spacing: sS(context).cW(width: 40),
                            runSpacing: sS(context).cH(height: 10),
                            children: [
                              ...List.generate(model.cardReciptList.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    model.setSelectedCardRecieptIndex(index);
                                  },
                                  child: GeneralContainer(
                                    width: 120,
                                    top: 4,
                                    bottom: 4,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GeneralIconDisplay(
                                            model.selectedCardRecieptIndex ==
                                                    index
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_off,
                                            model.selectedCardRecieptIndex ==
                                                    index
                                                ? colorsBucket!.primary
                                                : colorsBucket!.disabled,
                                            UniqueKey(),
                                            24),
                                        S(w: 8),
                                        S(
                                          w: 77,
                                          h: 16,
                                          child: InterText(
                                            model.cardReciptList[index],
                                            textFontWeight: FontWeight.w600,
                                            textFontSize: 12,
                                            noOfTextLine: 2,
                                            textColor:
                                                model.selectedCardRecieptIndex ==
                                                        index
                                                    ? colorsBucket!.title
                                                    : colorsBucket!
                                                        .contentDisabled,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),

                        // card value
                        Row(
                          children: [
                            InterText(
                              textBucket!.cardValue,
                              textFontSize: 12,
                            ),
                          ],
                        ),
                        S(h: 10),
                        Row(
                          spacing: sS(context).cW(width: 16),
                          children: [
                            ...List.generate(model.cardValueList.length,
                                (index) {
                              return GestureDetector(
                                onTap: () {
                                  model.setSelectedCardValueIndex(index);
                                },
                                child: GeneralContainer(
                                  allSide: 12,
                                  borderColor:
                                      model.selectedCardValueIndex == index
                                          ? colorsBucket!.transparent
                                          : colorsBucket!.borderDisabled,
                                  color: model.selectedCardValueIndex == index
                                      ? colorsBucket!.primary
                                      : colorsBucket!.backgroundMid,
                                  borderRadius: 8,
                                  child: InterText(
                                    model.cardValueList[index],
                                    textColor:
                                        model.selectedCardValueIndex == index
                                            ? colorsBucket!.white
                                            : colorsBucket!.subtitle,
                                    textFontSize: 12,
                                  ),
                                ),
                              );
                            })
                          ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              if (model.giftCardGeneralErrorText != '') ...[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    S(h: 5),
                                    S(
                                      h: calculateErrorTextHeight(
                                          model.giftCardGeneralErrorText,
                                          context),
                                      w: 335,
                                      child: InterText(
                                          model.giftCardGeneralErrorText,
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
                                  text: textBucket!.tradeCrypto, navigator: () {
                                model.revalidateAllFields(context);
                              }),
                            ],
                          ),
                        ),
                      ],
                    );
        });
  }
}
