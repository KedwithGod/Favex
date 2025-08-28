import '/model/utilities/imports/shared.dart';

class EnableBiometricPage extends StatelessWidget {
  const EnableBiometricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EnableBiometricViewModel>.reactive(
        viewModelBuilder: () => EnableBiometricViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(
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

                          S(h: 7),
                          InterText(textBucket!.enableBiometric),

                          S(h: 70),

                          const SvgPngImage(
                            path: 'biometric',
                            height: 183,
                            width: 151,
                            imageType: ImageTypeEnum.png,
                          ),
                          S(h: 100),
                          S(
                            h: 52,
                            w: 185,
                            child: InterText(
                              textBucket!.signInInstantlyWithTouchFaceID,
                              textFontSize: 18,
                              textFontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          S(h: 8),
                          S(
                            h: 32,
                            w: 206,
                            child: InterText(
                              textBucket!
                                  .wouldLikeToUseTouchFaceIDToSignIntoFavex,
                              textFontSize: 12,
                              textColor: colorsBucket!.subtitle,
                              textFontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          S(h: 40),
                          buttonNoPositioned(context,
                              text: textBucket!.yesEnableBiometrics,
                              navigator: () {
                            openBiometric(context, action: () {
                                // Navigate to another page or perform another action
                              context.goNamed(dashboardPageRoute);
                            });
                          }),
                          S(h: 10),
                          buttonNoPositioned(context,
                              text: textBucket!.notRightNow,
                              textColor: colorsBucket!.primary,
                              buttonColor: colorsBucket!.white,
                              borderColor: colorsBucket!.primary,
                              navigateTo: dashboardPageRoute),
                        ],
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}
