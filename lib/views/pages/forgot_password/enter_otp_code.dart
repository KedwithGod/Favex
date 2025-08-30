import '/model/utilities/imports/shared.dart';

class EnterOTPCodePage extends StatelessWidget {
  final String? nextPage;
  final String bottomSheetSubtitle;
  const EnterOTPCodePage({super.key, this.nextPage = createNewPasswordPageRoute, required this.bottomSheetSubtitle});

  @override
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailEntryViewModel>.reactive(
        viewModelBuilder: () => EmailEntryViewModel(),
        onViewModelReady: (model) {
        
        },
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

                          InterText(textBucket!.verificationCode),
                          S(h: 70),

                          const SvgPngImage(
                            path: 'lock',
                            height: 180,
                            width: 183,
                            imageType: ImageTypeEnum.png,
                          ),

                          S(h: 60),
                          // eneter otp
                          InterText(
                            textBucket!.enterOtp,
                            textFontSize: 18,
                            textFontWeight: FontWeight.w700,
                          ),
                          // enter otp subtitle
                          S(h: 4),
                          S(
                              w: 253,
                              h: 32,
                              child: InterText(
                                textBucket!.enterOTPSubtitle,
                                textFontSize: 12,
                                textAlign: TextAlign.center,
                                noOfTextLine: 2,
                              )),
                          S(h: 40),

                          PinEntryScreen(
                            onChanged: (String value) {
                              print('test');
                              model.otpOnChangedFunction(value);
                            },
                            onCompleted: (String value) {
                               print('test');
                               print(value);
                              model.validateOtpFunction(context,otp:value);
                            
                            },
                            errorTextActive: model.otpErrorBool,
                            bottomSheetSubtitle:bottomSheetSubtitle,
                            errortext: model.otpErrorText,
                            loadingApi:model.isbusy,
                            resendFunction: () {
                              model.sendOtp(context);
                            },
                            actionButtonFunction:(){
                              context.goNamed(nextPage!);
                            }
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}
