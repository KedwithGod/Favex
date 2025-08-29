import '/model/utilities/imports/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(
            bottomNavigationBar: pageTab(context, tabEnum: TabEnum.home),
            floatingActionButton: FloatingActionButton(
              backgroundColor: colorsBucket!.transparent,
              onPressed: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageAvatar(
                    imageRadius: 30,
                    backgroundColor: colorsBucket!.primary,
                  ),
                  const SvgPngImage(path: 'chat', height: 24, width: 24),
                ],
              ),
            ),
            containerColor: colorsBucket!.backgroundMid,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // user image
                                  const ImageAvatar(
                                    image: 'avatar',
                                    imageRadius: 25,
                                    imageType: ImageTypeEnum.png,
                                  ),
                                  S(w: 10),
                                  // user name
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InterText(
                                        "${model.testUser}👋",
                                        textFontWeight: FontWeight.w700,
                                        textFontSize: 12,
                                      ),
                                      InterText(
                                        textBucket!.goodMorning,
                                        textColor: colorsBucket!.subtitle,
                                        textFontSize: 12,
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              // notification
                              const SvgPngImage(
                                  path: 'notification', height: 45, width: 45)
                            ],
                          ),

                          // wallet details
                          S(h: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: colorsBucket!.primary,

                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/pngs/doodle.png'), // Replace with your PNG path
                                fit: BoxFit
                                    .cover, // Adjust how the image fits (cover, fill, contain, etc.)
                              ),
                              borderRadius: BorderRadius.circular(
                                  12), // Optional: rounded corners
                            ),
                            
                            padding: EdgeInsets.symmetric(
                                vertical: sS(context).cH(height: 15),
                                horizontal: sS(context).cW(width: 15)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InterText(
                                     model.selectedWallet ==
                                                      WalletTypeEnum.wallet
                                                  ? textBucket!.walletBalance: textBucket!.nfxWalletBalance ,
                                      textColor: colorsBucket!.titleSoft,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        GeneralBottomSheet.show(context,
                                            content: GeneralContainer(
                                              height: 300,
                                              width: 375,
                                              color: colorsBucket!.transparent,
                                              borderRadius: 24,
                                              left: 4,
                                              right: 4,
                                              top: 4,
                                              bottom: 49,
                                              child: Column(
                                                children: [
                                                  // title
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InterText(textBucket!
                                                          .selectWallet),
                                                      GestureDetector(
                                                        onTap: () {
                                                          context.pop();
                                                        },
                                                        child:
                                                            GeneralIconDisplay(
                                                                Icons.close,
                                                                colorsBucket!
                                                                    .title,
                                                                UniqueKey(),
                                                                15),
                                                      )
                                                    ],
                                                  ),
                                                  S(h: 30),
                                                  // wallet
                                                  GestureDetector(
                                                    onTap: () {
                                                      model.switchWalletBalance(
                                                          WalletTypeEnum
                                                              .wallet);
                                                      context.pop();
                                                    },
                                                    child: GeneralContainer(
                                                      height: 73,
                                                      width: 335,
                                                      borderRadius: 16,
                                                      left: 24,
                                                      right: 25,
                                                      bottom: 15,
                                                      top: 15,
                                                      color: colorsBucket!
                                                          .primaryLemon,
                                                      borderColor:
                                                          colorsBucket!.primary,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              // icons
                                                              Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  ImageAvatar(
                                                                    imageRadius:
                                                                        21,
                                                                    backgroundColor: colorsBucket!
                                                                        .primary
                                                                        .withOpacity(
                                                                            0.1),
                                                                  ),
                                                                  const SvgPngImage(
                                                                      path:
                                                                          'wallet',
                                                                      height:
                                                                          10,
                                                                      width:
                                                                          15),
                                                                ],
                                                              ),

                                                              S(w: 10),

                                                              //  text
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  InterText(
                                                                    textBucket!
                                                                        .walletBalance,
                                                                    textFontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    textFontSize:
                                                                        12,
                                                                  ),
                                                                  S(h: 3),
                                                                  InterText(
                                                                    "₦ ${displayWithComma(model.walletBalance)}",
                                                                    textColor:
                                                                        colorsBucket!
                                                                            .subtitle,
                                                                    textFontSize:
                                                                        12,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          if (model
                                                                  .selectedWallet ==
                                                              WalletTypeEnum
                                                                  .wallet) ...[
                                                            const SvgPngImage(
                                                                path: 'check',
                                                                height: 18,
                                                                width: 18)
                                                          ]
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  S(h: 16),
                                                  // nfx
                                                  GestureDetector(
                                                    onTap: () {
                                                      model.switchWalletBalance(
                                                          WalletTypeEnum.nfx);
                                                      context.pop();
                                                    },
                                                    child: GeneralContainer(
                                                      height: 73,
                                                      width: 335,
                                                      borderRadius: 16,
                                                      left: 24,
                                                      right: 25,
                                                      bottom: 15,
                                                      top: 15,
                                                      color:
                                                          colorsBucket!.white,
                                                      borderColor: colorsBucket!
                                                          .borderDisabled,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              // icons
                                                              Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  ImageAvatar(
                                                                    imageRadius:
                                                                        21,
                                                                    backgroundColor:
                                                                        colorsBucket!
                                                                            .backgroundMid,
                                                                  ),
                                                                  const SvgPngImage(
                                                                      path:
                                                                          'nfx',
                                                                      height:
                                                                          10,
                                                                      width:
                                                                          15),
                                                                ],
                                                              ),

                                                              S(w: 10),

                                                              //  text
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  InterText(
                                                                    textBucket!
                                                                        .nfxWallet,
                                                                    textFontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    textFontSize:
                                                                        12,
                                                                  ),
                                                                  S(h: 3),
                                                                  InterText(
                                                                    "₦ ${displayWithComma(model.walletBalance)}",
                                                                    textColor:
                                                                        colorsBucket!
                                                                            .subtitle,
                                                                    textFontSize:
                                                                        12,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          if (model
                                                                  .selectedWallet ==
                                                              WalletTypeEnum
                                                                  .nfx) ...[
                                                            const SvgPngImage(
                                                                path: 'check',
                                                                height: 18,
                                                                width: 18)
                                                          ]
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                      child: GeneralContainer(
                                       
                                        color: colorsBucket!.primary2,
                                        borderRadius: 6,
                                        allSide: 6,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InterText(
                                            model.selectedWallet == WalletTypeEnum.wallet?  model.naira:model.nfx,
                                             textFontSize: 12,
                                              textColor:
                                                  colorsBucket!.titleSoft,
                                            ),
                                            S(w:5),
                                            const SvgPngImage(
                                                path: 'down',
                                                height: 6,
                                                width: 6)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                S(h: 4),

                                // balance row
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InterText(
                                      model.naira,
                                      textColor: colorsBucket!.titleSoft,
                                      textFontSize: 10,
                                    ),
                                    S(w: 2),
                                    InterText(
                                      model.showBalance
                                          ? displayWithComma(
                                              (model.selectedWallet ==
                                                      WalletTypeEnum.wallet
                                                  ? model.walletBalance
                                                  : model.nfxBalance))
                                          : "*" *
                                              (model.selectedWallet ==
                                                      WalletTypeEnum.wallet
                                                  ? model.walletBalance.length
                                                  : model.nfxBalance.length),
                                      textColor: colorsBucket!.titleSoft,
                                      textFontSize: 18,
                                      textFontWeight: FontWeight.w700,
                                    ),
                                    S(w: 8),
                                    GestureDetector(
                                      onTap: () {
                                        model.switchBalanceVisibility();
                                      },
                                      child: model.showBalance == false
                                          ? GeneralIconDisplay(
                                              Icons.remove_red_eye,
                                              colorsBucket!.disabled,
                                              UniqueKey(),
                                              20)
                                          : SvgPngImage(
                                              path: 'eye',
                                              height: 20,
                                              width: 20,
                                              colorFilter: ColorFilter.mode(
                                                  colorsBucket!.titleSoft,
                                                  BlendMode.srcIn)),
                                    )
                                  ],
                                ),
                                // button row
                                S(h: 12),
                                Row(
                                  children: [
                                    // add money

                                    GeneralContainer(
                                     left: 14.5, right: 14.5, top: 9,bottom: 9,
                                      color: colorsBucket!.primary2,
                                      borderRadius: 6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SvgPngImage(
                                              path: 'add',
                                              height: 15,
                                              width: 15),
                                          S(w: 4),
                                          InterText(
                                            textBucket!.addMoney,
                                            textFontSize: 12,
                                            textColor: colorsBucket!.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    S(w: 12),
                                    // transfer
                                    GeneralContainer(
                                      left: 14.5, right: 14.5, top: 9,bottom: 9,
                                      color: colorsBucket!.primary2,
                                      borderRadius: 6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SvgPngImage(
                                              path: 'transfer',
                                              height: 15,
                                              width: 15),
                                          S(w: 4),
                                          InterText(
                                            textBucket!.transfer,
                                            textFontSize: 12,
                                            textColor: colorsBucket!.white,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          // quick actions
                          S(h: 20),

                          GeneralContainer(
                            color: colorsBucket!.white,
                            borderRadius: 12,
                            allSide: 18,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InterText(textBucket!.quickActions,
                                        textFontSize: 12),
                                  ],
                                ),
                                S(h: 8),
                                Wrap(
                                  runSpacing: sS(context).cH(height: 16),
                                  spacing: sS(context).cW(width: 16),
                                  children: [
                                    for (int index in List.generate(
                                        model.quickActions.length,
                                        (index) => index)) ...[
                                      GestureDetector(
                                        onTap: () {
                                         context.goNamed( model.quickActions[index]['navigateTo']);
                                        },
                                        child: GeneralContainer(
                                          height: 70,
                                          width: 88,
                                          color: colorsBucket!.primaryLemon,
                                          borderRadius: 8,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  ImageAvatar(
                                                    imageRadius: 12,
                                                    backgroundColor:
                                                        colorsBucket!.white,
                                                  ),
                                                  SvgPngImage(
                                                      path: model.quickActions[
                                                          index]['icon'],
                                                      height: 15,
                                                      width: 15),
                                                ],
                                              ),
                                              S(h: 3),
                                              InterText(
                                                model.quickActions[index]
                                                    ['name'],
                                                textFontSize: 10,
                                                textFontWeight: FontWeight.w600,
                                                textColor:
                                                    colorsBucket!.primary,
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //  ads
                          S(h: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: colorsBucket!.primary,

                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/pngs/doodle.png'), // Replace with your PNG path
                                fit: BoxFit
                                    .cover, // Adjust how the image fits (cover, fill, contain, etc.)
                              ),
                              borderRadius: BorderRadius.circular(
                                  8), // Optional: rounded corners
                            ),
                          
                            padding: EdgeInsets.symmetric(
                                horizontal: sS(context).cW(width: 15)),
                            child: Row(
                              children: [
                                S(w: 27),
                                S(
                                  h: 53,
                                  w: 113,
                                  child: InterText(
                                    textBucket!
                                        .tradeUSDTBTCAndAllCryptoToCashInstantly,
                                    textFontSize: 12,
                                    textFontWeight: FontWeight.w500,
                                    textColor: colorsBucket!.titleSoft,
                                    noOfTextLine: 3,
                                  ),
                                ),
                                S(w: 27),
                                S(
                                  w: 127,
                                  h: 87,
                                  child: Stack(
                                    children: [
                                      rowPositioned(
                                          top: 20,
                                          right: 10,
                                          child: const SvgPngImage(
                                            path: 'bitcoin',
                                            height: 32,
                                            width: 32,
                                            imageType: ImageTypeEnum.png,
                                          )),
                                      const SvgPngImage(
                                        path: 'phone',
                                        height: 87,
                                        width: 110,
                                        imageType: ImageTypeEnum.png,
                                      ),
                                      rowPositioned(
                                        top: 52,
                                        left: -1,
                                        child: const SvgPngImage(
                                          path: 'usdt',
                                          height: 32,
                                          width: 32,
                                          imageType: ImageTypeEnum.png,
                                        ),
                                      ),
                                      rowPositioned(
                                          top: 56,
                                          left: 56,
                                          child: GeneralContainer(
                                            height: 23,
                                            width: 61,
                                            color: colorsBucket!.successSoft,
                                            borderRadius: 6,
                                            child: Center(
                                                child: InterText(
                                              textBucket!.fastAndSafe,
                                              textFontWeight: FontWeight.w300,
                                              textFontSize: 8,
                                            )),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // recent activities
                          S(h: 20),

                          GeneralContainer(
                          
                            color: colorsBucket!.white,
                            left: 18,
                            top: 21,
                            right: 18,
                            bottom: 21,
                            borderRadius: 16,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InterText(
                                      textBucket!.recentActivities,
                                      textFontSize: 12,
                                    ),
                                  ],
                                ),
                                S(h: 20),
                                //  activitiy
                                S(
                                  h: 54,
                                  w: 299,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const SvgPngImage(
                                              path: 'tesla',
                                              height: 44,
                                              width: 44),
                                          S(w: 10),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const InterText(
                                                'USDT - \$900',
                                                textFontWeight: FontWeight.w600,
                                                textFontSize: 12,
                                              ),
                                              S(h: 2),
                                              InterText(
                                                'Crypto Exchange',
                                                textColor:
                                                    colorsBucket!.disabled,
                                                textFontSize: 10,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const InterText(
                                            '₦160,000.00',
                                            textFontWeight: FontWeight.w600,
                                            textFontSize: 12,
                                          ),
                                          S(h: 2),
                                          InterText(
                                            textBucket!.completed,
                                            textColor:
                                                colorsBucket!.successHard,
                                            textFontSize: 10,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
        });
  }
}
