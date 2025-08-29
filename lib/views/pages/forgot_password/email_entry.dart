// page to collect user email and send user otp
import '../../../model/utilities/imports/shared.dart';

class EmailEntryPage extends StatelessWidget {
  const EmailEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailEntryViewModel>.reactive(
        viewModelBuilder: () => EmailEntryViewModel(),
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
                          S(
                            h: 51,
                            w: 335,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    router.goNamed(loginPageRoute);
                                  },
                                  child: GeneralContainer(
                                    height: 34,
                                    width: 51 *
                                        sS(context).removeWidthAdjustment(),
                                    color: colorsBucket!.backgroundMid,
                                    borderRadius: 16,
                                    child: GeneralIconDisplay(
                                        LineIcons.arrowLeft,
                                        colorsBucket!.title,
                                        UniqueKey(),
                                        25),
                                  ),
                                ),
                                S(w: 57),
                                InterText(textBucket!.forgotPassword),
                              ],
                            ),
                          ),
                          S(h: 40),
                          // forgot password text
                          InterText(
                            textBucket!.forgotPassword,
                            textFontSize: 18,
                            textFontWeight: FontWeight.w700,
                          ),
                          // forgot password subtitle
                          S(h: 4),
                          S(
                              w: 237,
                              h: 32,
                              child: InterText(
                                textBucket!.enterOtpEmail,
                                textFontSize: 12,
                                textAlign: TextAlign.center,
                                noOfTextLine: 2,
                              )),
                          S(h: 40),
                          Row(
                            children: [
                              InterText(
                                textBucket!.emailAddress,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),

                          // email address label
                          S(
                            w: 335,
                            h: 461,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FormattedTextFields(
                                  textFieldController: model.emailController,
                                  textFieldHint: textBucket!.emailHint,
                                  onChangedFunction: (onchange) {
                                    model.onChangedFunctionEmail();
                                  },
                                  errorText: model.emailErrorText,
                                  errorTextActive: model.emailErrorBool,
                                  focusNode: model.emailFocusNode,
                                  suffixIcon: model.emailNotValid
                                      ? S()
                                      : Container(
                                          width: sS(context)
                                              .cW(width: 24), // Control width
                                          height: sS(context)
                                              .cH(height: 24), // Control height
                                          alignment: Alignment.center,
                                          child: const SvgPngImage(
                                            path: 'check',
                                            height: 20,
                                            width: 20,
                                          )),
                                ),

                                // email addres text

                                // get otp button

                                buttonNoPositioned(context,
                                    text: textBucket!.getOTP,
                                    textColor: model.emailNotValid == false
                                        ? colorsBucket!.primarySoft
                                        : colorsBucket!.subtitle,
                                    buttonColor: model.emailNotValid == false
                                        ? colorsBucket!.primary
                                        : colorsBucket!.disabled,
                                    navigator: () {
                                  if (model.emailNotValid == false) {
                                    context.goNamed(
                                      enterOTPCodePageRoute,
                                      extra: {
                                        'nextPage': createNewPasswordPageRoute,
                                        'bottomSheetSubtitle': textBucket!
                                            .verificationCompletedNextStepButton,
                                      },
                                    );
                                  }
                                })
                              ],
                            ),
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
