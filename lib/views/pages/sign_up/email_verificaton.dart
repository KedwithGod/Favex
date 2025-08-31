import '/model/utilities/imports/shared.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailVerificationViewModel>.reactive(
        viewModelBuilder: () => EmailVerificationViewModel(),
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
                          const StepTracker(
                            currentStep: 1,
                          ),
                          S(h: 30),
                          //  title
                          Row(
                            children: [
                              InterText(
                                textBucket!.createAccount,
                                textFontSize: 16,
                                textFontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          //  subtitle
                          S(h: 12),
                          Row(
                            children: [
                              S(
                                  w: 237,
                                  h: 32,
                                  child: InterText(
                                    textBucket!
                                        .signUpEmailAddressForOTPVerification,
                                    textFontSize: 12,
                                    textAlign: TextAlign.left,
                                    noOfTextLine: 2,
                                  )),
                            ],
                          ),
                          S(h: 20),
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
                            h: 583,
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

                                Column(
                                  children: [
                                    S(
                                        w: 281,
                                        h: 32,
                                        child: Wrap(
                                          spacing: 5,
                                          alignment: WrapAlignment.center,
                                          children: [
                                            InterText(textBucket!
                                                .continueAgreeingToFavex, textFontSize: 10, textColor: colorsBucket!.subtitle,),
                                            InterText(textBucket!
                                                .termsAndConditions, textFontSize: 10, textColor: colorsBucket!.primary, textFontWeight: FontWeight.w600,),
                                            InterText(textBucket!
                                                .and, textFontSize: 10, textColor: colorsBucket!.subtitle,),
                                            InterText(textBucket!
                                                .privacyPolicy, textFontSize: 10, textColor: colorsBucket!.primary,textFontWeight: FontWeight.w600,),
                                          ],
                                        )),
                                    S(h: 17),
                                    buttonNoPositioned(context,
                                        text: textBucket!.continueText,
                                        textColor: model.emailNotValid == false
                                            ? colorsBucket!.primarySoft
                                            : colorsBucket!.subtitle,
                                        buttonColor:
                                            model.emailNotValid == false
                                                ? colorsBucket!.primary
                                                : colorsBucket!.disabled,
                                        navigator:(){
                                         model.revalidateAllFields(context);
                                        }),
                                  ],
                                )
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
