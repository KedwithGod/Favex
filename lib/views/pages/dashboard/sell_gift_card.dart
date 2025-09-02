import '/model/utilities/imports/shared.dart';

class SellGiftCard extends StatelessWidget {
  const SellGiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellGiftCardViewModel>.reactive(
        viewModelBuilder: () => SellGiftCardViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(containerColor: colorsBucket!.backgroundMid, children: [
            rowPositioned(
                top: 0,
                child: Column(
                  children: [
                    S(
                      h: 38,
                      w: 334,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              router.goNamed(homePageRoute);
                            },
                            child: GeneralContainer(
                              height: 34,
                              width: 51 * sS(context).removeWidthAdjustment(),
                              color: colorsBucket!.transparent,
                              borderRadius: 16,
                              child: GeneralIconDisplay(LineIcons.arrowLeft,
                                  colorsBucket!.title, UniqueKey(), 25),
                            ),
                          ),
                          S(w: 75),
                          InterText(textBucket!.sellGiftcard)
                        ],
                      ),
                    ),
                    S(h: 27),
                    // search field
                    FormattedTextFields(
                      textFieldController: model.searchController,
                      textFieldHint: textBucket!.searchCard,
                      onChangedFunction: (value) {},
                      errorTextActive: model.searchErrorBool,
                      focusNode: model.searchFocusNode,
                      errorText: '',
                      containerColor: colorsBucket!.white,
                      prefixIcon: S(
                        h: 56,
                        w: 40,
                        child: Row(
                          children: [
                            S(w: 10),
                            const SvgPngImage(
                                path: 'search', height: 16, width: 16),
                            S(w: 5),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            rowPositioned(
                top: 125,
                bottom: 20,
                child: S(
                  h: 748,
                  w: 335,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        S(h: 16),
                        // featured
                        GeneralContainer(
                          color: colorsBucket!.white,
                          borderRadius: 12,
                          left: 29,
                          right: 28.5,
                          bottom: 29.5,
                          top: 30,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  textBucket!.topTradedCards,
                                  textFontSize: 12,
                                  textFontWeight: FontWeight.w600,
                                ),
                                S(h: 24),
                                Wrap(
                                  spacing: sS(context).cW(width: 41),
                                  runSpacing: sS(context).cH(height: 30),
                                  children: [
                                    for (int index in List.generate(
                                        6, (index) => index)) ...[
                                      S(
                                        h: 60,
                                        w: 61,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SvgPngImage(
                                                path: 'amazon',
                                                height: 40,
                                                width: 41),
                                            S(h: 4),
                                            S(
                                              h: 16,
                                              w: 61,
                                              child: const InterText(
                                                'Amazon',
                                                textAlign: TextAlign.center,
                                                textFontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        // list of giftcards
                        S(h: 16),

                        GeneralContainer(
                            color: colorsBucket!.white,
                            height: 90.0 * model.filteredGiftCardList.length,
                            width: 335,
                            left: 18,
                            right: 17,
                            top: 32,
                            bottom: 5,
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GeneralContainer(
                                        color: colorsBucket!.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPngImage(
                                                path:
                                                    model.filteredGiftCardList[
                                                        index]['icon'],
                                                height: 40,
                                                width: 41),
                                            S(w: 10),
                                            InterText(
                                              model.filteredGiftCardList[index]
                                                  ['name'],
                                              textAlign: TextAlign.center,
                                              textFontSize: 12,
                                            )
                                          ],
                                        ),
                                      ),
                                      if (index ==
                                          model.filteredGiftCardList.length -
                                              1) ...[S(h: 25)]
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      S(h: 16),
                                      DividerWidget(),
                                      S(h: 16),
                                      // const DividerWidget(),
                                    ],
                                  );
                                },
                                itemCount: model.filteredGiftCardList.length))
                      ],
                    ),
                  ),
                ))
          ]);
        });
  }
}
