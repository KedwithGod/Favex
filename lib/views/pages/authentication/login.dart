import '../../../model/utilities/imports/shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(
            children: [
              rowPositioned(
                  top: 30,
                  bottom: 20,
                  child: S(
                    h: 700,
                    w: 335,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // logo
                          const SvgPngImage(path: 'logo', height: 38, width: 160),
                          S(h: 20),
                          // title
                          InterText(
                            textBucket!.welcomeMessage,
                            textFontSize: 18,
                            textFontWeight: FontWeight.w700,
                          ),

                          // subtitle
                          S(h: 6),
                          InterText(
                            textBucket!.welcomeMessageSubtitle,
                            noOfTextLine: 2,
                            textFontSize: 12,
                            textColor: colorsBucket!.subtitle,
                            textAlign: TextAlign.center,
                          ),

                          S(h: 67),

                          Column(
                            
                            children: [
                              // email
                              Row(
                                children: [
                                  InterText(
                                    textBucket!.emailAddress,
                                    textFontSize: 12,
                                  ),
                                ],
                              ),
                              S(h: 10),
                              FormattedTextFields(
                                textFieldController: model.emailController,
                                textFieldHint: textBucket!.enterEmail,
                                onChangedFunction: (onchange) { model.onChangedFunctionEmail();},
                                errorText: model.emailErrorText,
                                errorTextActive: model.emailErrorBool,
                                focusNode: model.emailFocusNode,
                                suffixIcon: model.emailNotValid?S(): Container(
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
                              S(h: 24),
                              // password
                              Row(
                                children: [
                                  InterText(
                                    textBucket!.password,
                                    textFontSize: 12,
                                  ),
                                ],
                              ),
                              S(h: 10),

                              FormattedTextFields(
                                textFieldController: model.passwordController,
                                onChangedFunction: (value) {model.onChangedFunctionPassword();},
                                errorTextActive: model.passwordErrorBool,
                                focusNode: model.passwordFocusNode,
                                textFieldHint: textBucket!.enterPassword,
                                errorText: model.passwordErrorText,
                                obscureText: model.showPasswordBool,
                                suffixIcon:  GestureDetector(
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
                                        path: model.passwordNotValid?'eye':'check',
                                        height: 20,
                                        width: 20,
                                        colorFilter:model.passwordNotValid?ColorFilter.mode(
                                            model.showPasswordBool
                                        ?  colorsBucket!.borderMid: colorsBucket!.primary,
                                            BlendMode.srcIn):null,
                                      )),
                                ),
                              ),

                              // forgot password
                              S(
                                h: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InterText(textBucket!.forgotPassword),
                                  S(w: 5),
                                  InterText(
                                    textBucket!.resetIt,
                                    textColor: colorsBucket!.primary,
                                    textFontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              // button
                              S(
                                h: 24,
                              ),
                              buttonNoPositioned(context,
                                  text: textBucket!.login,
                                  navigator: (){model.revalidateAllFields(context);},
                                  textColor:  model.emailNotValid ==false && model.passwordNotValid ==false? colorsBucket!.primarySoft:colorsBucket!.subtitle,
                                  buttonColor: model.emailNotValid ==false && model.passwordNotValid ==false?colorsBucket!.primary: colorsBucket!.disabled),
                              S(
                                h: 24,
                              ),
                              // sign in with
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GeneralContainer(
                                      height: 0.1,
                                      width: 118,
                                      color: colorsBucket!.borderMid),
                                  InterText(
                                    textBucket!.signInWith,
                                    textFontSize: 12,
                                  ),
                                  GeneralContainer(
                                      height: 0.1,
                                      width: 118,
                                      color: colorsBucket!.borderMid),
                                ],
                              ),
                              S(
                                h: 20,
                              ),

                              // icon links
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SvgPngImage(
                                      path: 'google', height: 50, width: 50),
                                  S(
                                    w: 12,
                                  ),
                                  const SvgPngImage(
                                      path: 'facebook', height: 50, width: 50),
                                  S(
                                    w: 12,
                                  ),
                                  const SvgPngImage(
                                      path: 'apple', height: 50, width: 50),
                                ],
                              ),

                              S(
                                h: 40,
                              ),

                              // sign up
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InterText(
                                    textBucket!.noAccount,
                                    textFontSize: 12,
                                  ),
                                  S(w: 5),
                                  InterText(
                                    textBucket!.signUp,
                                    textColor:  colorsBucket!.primary,
                                    textFontSize: 12,
                                    textFontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}
