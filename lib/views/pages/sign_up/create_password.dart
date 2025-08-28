import '/model/utilities/imports/shared.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePasswordViewModel>.reactive(
        viewModelBuilder: () => CreatePasswordViewModel(),
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
                            currentStep: 3,
                          ),
                          S(h: 30),
                          // forgot password text
                          Row(
                            children: [
                              InterText(
                                textBucket!.createPassword,
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
                                  h: 34,
                                  child: InterText(
                                    textBucket!
                                        .createPasswordForAccountAccessInSecureLocation,
                                    textFontSize: 12,
                                    textAlign: TextAlign.left,
                                    noOfTextLine: 2,
                                  )),
                            ],
                          ),
                          S(h: 20),

                          // password
                          Row(
                            children: [
                              InterText(
                                textBucket!.createPassword,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),
                          // password field
                          FormattedTextFields(
                            textFieldController: model.passwordController,
                            onChangedFunction: (value) {
                              model.onChangedFunctionPasswordNew();
                            },
                            errorTextActive: model.passwordErrorBool,
                            focusNode: model.passwordFocusNode,
                            textFieldHint: textBucket!.enterPassword,
                            errorText: model.passwordErrorText,
                            obscureText: model.showPasswordBool,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                model.showPassword();
                              },
                              child: Container(
                                  width: sS(context)
                                      .cW(width: 24), // Control width
                                  height: sS(context)
                                      .cH(height: 24), // Control height
                                  alignment: Alignment.center,
                                  child: SvgPngImage(
                                    path: model.passwordNotValid
                                        ? 'eye'
                                        : 'check',
                                    height: 20,
                                    width: 20,
                                    colorFilter: model.passwordNotValid
                                        ? ColorFilter.mode(
                                            model.showPasswordBool
                                                ? colorsBucket!.borderMid
                                                : colorsBucket!.primary,
                                            BlendMode.srcIn)
                                        : null,
                                  )),
                            ),
                          ),
                          S(h: 16),
                          if (model.passwordController.text
                              .trim()
                              .isNotEmpty) ...[
                            Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildCriteria('At least 8 characters',
                                    model.true_result['char_length'] ?? false),
                                buildCriteria('At least one uppercase letter',
                                    model.true_result['upper_case'] ?? false),
                                buildCriteria('At least one lowercase letter',
                                    model.true_result['lower_case'] ?? false),
                                buildCriteria('At least one number',
                                    model.true_result['numeric'] ?? false),
                                buildCriteria('At least one special character',
                                    model.true_result['special'] ?? false),
                              ],
                            ),
                          ],
                          S(h: 24),
                          // confirm password
                          Row(
                            children: [
                              InterText(
                                textBucket!.confirmPassword,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),
                          // password field
                          FormattedTextFields(
                            textFieldController:
                                model.confirmPasswordController,
                            onChangedFunction: (value) {
                              model.onChangedFunctionConfirmPassword();
                            },
                            errorTextActive: model.confirmPasswordErrorBool,
                            focusNode: model.confirmPasswordFocusNode,
                            textFieldHint: textBucket!.enterPassword,
                            errorText: model.confirmPasswordErrorText,
                            obscureText: model.showConfirmPasswordBool,
                            suffixIcon: Container(
                                width:
                                    sS(context).cW(width: 24), // Control width
                                height: sS(context)
                                    .cH(height: 24), // Control height
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    model.showConfirmPassword();
                                  },
                                  child: SvgPngImage(
                                    path: model.confirmPasswordNotValid
                                        ? 'eye'
                                        : 'check',
                                    height: 20,
                                    width: 20,
                                    colorFilter: model.confirmPasswordNotValid
                                        ? ColorFilter.mode(
                                            model.showConfirmPasswordBool
                                                ? colorsBucket!.borderMid
                                                : colorsBucket!.primary,
                                            BlendMode.srcIn)
                                        : null,
                                  ),
                                )),
                          ),

                          S(h: 30),
                          buttonNoPositioned(context,
                              text: textBucket!.continueText,
                              textColor: model.passwordNotValid == false &&
                                      model.confirmPasswordNotValid == false
                                  ? colorsBucket!.primarySoft
                                  : colorsBucket!.subtitle,
                              buttonColor: model.passwordNotValid == false &&
                                      model.confirmPasswordNotValid == false
                                  ? colorsBucket!.primary
                                  : colorsBucket!.disabled, navigator: () {
                            model.restPasseordValidateAllFields(context);
                          }),
                        ],
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}
