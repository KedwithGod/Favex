// page to collect user email and send user otp

import '../../../model/utilities/imports/shared.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateNewPasswordViewMoel>.reactive(
        viewModelBuilder: () => CreateNewPasswordViewMoel(),
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
                                    router.goNamed(emailEntryPageRoute);
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
                                InterText(textBucket!.createNewPassword),
                              ],
                            ),
                          ),
                          S(h: 70),

                          const SvgPngImage(
                            path: 'password_lock',
                            height: 180,
                            width: 183,
                            imageType: ImageTypeEnum.png,
                          ),
                          S(h: 60),

                          // password
                          Row(
                            children: [
                              InterText(
                                textBucket!.newPassword,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),
                          // password field
                          FormattedTextFields(
                            textFieldController: model.passwordController,
                            onChangedFunction: (value) {
                              model.onChangedFunctionPassword();
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
                          S(h: 24),
                          // confirm password
                          Row(
                            children: [
                              InterText(
                                textBucket!.confirm,
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                model.showConfirmPassword();
                              },
                              child: Container(
                                  width: sS(context)
                                      .cW(width: 24), // Control width
                                  height: sS(context)
                                      .cH(height: 24), // Control height
                                  alignment: Alignment.center,
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
                                  )),
                            ),
                          ),

                          S(h: 24),

                          // set password

                          buttonNoPositioned(context,
                              text: textBucket!.createNewPassword,
                              textColor: model.passwordNotValid == false &&
                                      model.confirmPasswordNotValid == false
                                  ? colorsBucket!.primarySoft
                                  : colorsBucket!.subtitle,
                              buttonColor: model.passwordNotValid == false &&
                                      model.confirmPasswordNotValid == false
                                  ? colorsBucket!.primary
                                  : colorsBucket!.disabled, navigator: () {
                                      model.revalidateAllFields(context);
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
