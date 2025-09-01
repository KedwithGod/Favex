import '/model/utilities/imports/shared.dart';

class SellCryptoPage extends StatelessWidget {
  const SellCryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SellCryptoViewModel>.reactive(
        viewModelBuilder: () => SellCryptoViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(containerColor: colorsBucket!.backgroundMid, children: [
            rowPositioned(
                top: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.goNamed(homePageRoute);
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
                        InterText(textBucket!.sellCryptocurrency)
                      ],
                    ),
                    S(h: 27),
                    // search field
                    FormattedTextFields(
                      textFieldController: model.searchController,
                      textFieldHint: textBucket!.searchCoin,
                      onChangedFunction: (value) {},
                      errorTextActive: model.searchErrorBool,
                      focusNode: model.searchFocusNode,
                      errorText: '',
                      containerColor: colorsBucket!.white,
                      suffixIcon: GeneralIconDisplay(Icons.filter_list,
                          colorsBucket!.backgroundDisabled, UniqueKey(), 16),
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
                                  textBucket!.topTradedCoin,
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
                                              path: 'bitcoin',
                                              height: 40,
                                              width: 41,
                                              imageType: ImageTypeEnum.png,
                                            ),
                                            S(h: 4),
                                            S(
                                              h: 16,
                                              w: 61,
                                              child: const InterText(
                                                'Bitcoin',
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
                            height: (74.0 * model.filteredCryptoList.length) +90,
                            width: 335,
                            left: 18,
                            right: 17,
                            top: 32,
                            bottom: 5,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InterText(
                                      textBucket!.AllCryptoAsset,
                                      textFontSize: 12,
                                      textFontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                S(h: 30),
                                S(
                                  h: 75.0 * model.filteredCryptoList.length,
                                  w: 335,
                                  child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GeneralContainer(
                                          color: colorsBucket!.white,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPngImage(
                                                path: model.filteredCryptoList[
                                                    index]['icon'],
                                                height: 40,
                                                width: 41,
                                                imageType: ImageTypeEnum.png,
                                              ),
                                              S(w: 10),
                                              InterText(
                                                model.filteredCryptoList[index]
                                                    ['name'],
                                                textAlign: TextAlign.center,
                                                textFontSize: 12,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            S(h: 16),
                                            const DividerWidget(),
                                            S(h: 16),
                                            // const DividerWidget(),
                                          ],
                                        );
                                      },
                                      itemCount:
                                          model.filteredCryptoList.length),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ))
          ]);
        });
  }
}
