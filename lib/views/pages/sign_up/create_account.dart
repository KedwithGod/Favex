import '/model/utilities/imports/shared.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
        viewModelBuilder: () => CreateAccountViewModel(),
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
                            currentStep: 2,
                          ),
                          S(h: 30),
                          // forgot password text
                          Row(
                            children: [
                              InterText(
                                textBucket!.createAnAccount,
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
                                    textBucket!.correctDetailsFlag,
                                    textFontSize: 12,
                                    textAlign: TextAlign.left,
                                    noOfTextLine: 2,
                                  )),
                            ],
                          ),
                          S(h: 20),

                          S(
                            w: 335,
                            h: 88 +
                                (model.firstNameErrorBool
                                    ? (calculateErrorTextHeight(
                                            model.firstNameErrorText, context) +
                                        10)
                                    : model.lastNameErrorBool
                                        ? (calculateErrorTextHeight(
                                                model.lastNameErrorText,
                                                context) +
                                            10)
                                        : 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // first name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // text
                                    Row(
                                      children: [
                                        InterText(
                                          textBucket!.firstName,
                                          textFontSize: 12,
                                        ),
                                      ],
                                    ),
                                    S(h: 10),
                                    // text field
                                    FormattedTextFields(
                                      textFieldController:
                                          model.firstNameController,
                                      textFieldHint: textBucket!.firstName,
                                      width: 162,
                                      onChangedFunction: (onchange) {
                                        model.onChangedFunctionFirstName();
                                      },
                                      errorText: model.firstNameErrorText,
                                      errorTextActive: model.firstNameErrorBool,
                                      focusNode: model.firstNameFocusNode,
                                    )
                                  ],
                                ),
                                S(w: 11),
                                // last name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // text
                                    Row(
                                      children: [
                                        InterText(
                                          textBucket!.lastName,
                                          textFontSize: 12,
                                        ),
                                      ],
                                    ),
                                    S(h: 10),
                                    // text field
                                    FormattedTextFields(
                                      textFieldController:
                                          model.lastNameController,
                                      textFieldHint: textBucket!.lastName,
                                      width: 162,
                                      onChangedFunction: (onchange) {
                                        model.onChangedFunctionLastName();
                                      },
                                      errorText: model.lastNameErrorText,
                                      errorTextActive: model.lastNameErrorBool,
                                      focusNode: model.lastNameFocusNode,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          S(h: 24),

                          // username
                          Row(
                            children: [
                              InterText(
                                textBucket!.username,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),

                          // text field
                          FormattedTextFields(
                            textFieldController: model.usernameController,
                            textFieldHint: textBucket!.createUsername,
                            onChangedFunction: (onchange) {
                              model.onChangedFunctionUsername();
                            },
                            errorText: model.usernameErrorText,
                            errorTextActive: model.usernameErrorBool,
                            focusNode: model.usernameFocusNode,
                            suffixIcon: model.usernameNotValid
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
                            prefixIcon: S(
                              w: 43,
                              h: 40,
                              child: Row(
                                children: [
                                  S(w: 14),
                                  InterText(
                                    '@',
                                    textFontSize: 24,
                                    textColor: model.usernameNotValid &&
                                            model.usernameController.text
                                                .isNotEmpty
                                        ? colorsBucket!.alertHard
                                        : colorsBucket!.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          S(h: 24),

                          // phone number
                          Row(
                            children: [
                              InterText(
                                textBucket!.phoneNumber,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),

                          PhoneNumberTextField(
                            textFieldController: model.phonenumberController,
                            focusNode: model.phonenumberFocusNode,
                            onChangedFunction: (value) {
                              model.onChangedFunctionPhone();
                            },
                            errorTextActive: model.phonenumberErrorBool,
                            errorText: model.phoneErrorText,
                          ),

                          // text field
                          S(h: 24),
                          // how did you hear about us
                          Row(
                            children: [
                              InterText(
                                textBucket!.howDoYouHearAboutUsOptional,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),

                          InkWell(
                            onTap: () {
                              GeneralBottomSheet.show(context,
                                  content: GeneralContainer(
                                    height: 600,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InterText(textBucket!.selectOption),
                                            GestureDetector(
                                              onTap: () {
                                                context.pop();
                                              },
                                              child: GeneralIconDisplay(
                                                  Icons.close,
                                                  colorsBucket!.title,
                                                  UniqueKey(),
                                                  15),
                                            )
                                          ],
                                        ),
                                        S(h: 24),

                                        for (int index in List.generate(
                                            model.socialSources.length,
                                            (index) => index)) ...[
                                          GestureDetector(
                                            onTap: () {
                                              model.setSourceIndex(index);
                                            },
                                            child: GeneralContainer(
                                              height: 64,
                                              width: 335,
                                              color:
                                                  model.selectedSourceIndex ==
                                                          index
                                                      ? colorsBucket!
                                                          .backgroundMid
                                                      : colorsBucket!.white,
                                              left: 12.5,
                                              right: 12.5,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPngImage(
                                                          path: model
                                                                  .socialSources[
                                                              index]['icon'],
                                                          height: 19,
                                                          width: 19),
                                                      S(w: 10),
                                                      InterText(
                                                        model.socialSources[
                                                            index]['name'],
                                                        textFontSize: 12,
                                                      )
                                                    ],
                                                  ),
                                                  if (model
                                                          .selectedSourceIndex ==
                                                      index) ...[
                                                    Container(
                                                        width: sS(context).cW(
                                                            width:
                                                                18), // Control width
                                                        height: sS(context).cH(
                                                            height:
                                                                18), // Control height
                                                        alignment:
                                                            Alignment.center,
                                                        child:
                                                            const SvgPngImage(
                                                          path: 'check',
                                                          height: 20,
                                                          width: 20,
                                                        ))
                                                  ]
                                                ],
                                              ),
                                            ),
                                          ),
                                          S(h: 16),
                                          // divider
                                          if (model.selectedSourceIndex !=
                                              index) ...[
                                            GeneralContainer(
                                                height: 1,
                                                width: 335,
                                                color: colorsBucket!
                                                    .borderDisabled)
                                          ]
                                        ]
                                        // list of options
                                      ],
                                    ),
                                  ));
                            },
                            child: GeneralContainer(
                              height: 56,
                              width: 335,
                              color: colorsBucket!.backgroundMid,
                              left: 14,
                              right: 15,
                              borderRadius: 16,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (model.selectedSourceIndex == null) ...[
                                    InterText(textBucket!.selectOption),
                                  ],
                                  if (model.selectedSourceIndex != null) ...[
                                    Row(
                                      children: [
                                        SvgPngImage(
                                            path: model.socialSources[model
                                                .selectedSourceIndex!]['icon'],
                                            height: 19,
                                            width: 19),
                                        S(w: 10),
                                        InterText(model.selectedSourceIndex ==
                                                null
                                            ? textBucket!.selectOption
                                            : model.socialSources[model
                                                .selectedSourceIndex!]['name'])
                                      ],
                                    )
                                  ],
                                  S(
                                    h: 13,
                                    w: 13,
                                    child: const SvgPngImage(
                                        path: 'arrow_down',
                                        height: 11,
                                        width: 8),
                                  )
                                ],
                              ),
                            ),
                          ),

                          S(h: 24),

                          // referral tag
                          Row(
                            children: [
                              InterText(
                                textBucket!.referralTagOptional,
                                textFontSize: 12,
                              ),
                            ],
                          ),
                          S(h: 10),
                          // text field
                          FormattedTextFields(
                            textFieldController: model.referralTagController,
                            textFieldHint: textBucket!.enterReferralTag,
                            onChangedFunction: (onchange) {
                              model.onChangedFunctionReferralTag();
                            },
                            errorText: model.referralTagErrorText,
                            errorTextActive: model.referralTagErrorBool,
                            focusNode: model.referralTagFocusNode,
                          ),

                          // text field

                          S(h: 30),
                          buttonNoPositioned(context,
                              text: textBucket!.continueText,
                              textColor:model.allFieldsAreValid() == true
                                  ? colorsBucket!.primarySoft
                                  : colorsBucket!.subtitle,
                              buttonColor: model.allFieldsAreValid() == true
                                  ? colorsBucket!.primary
                                  : colorsBucket!.disabled, navigator: () {
                                    model.revalidateAllFields();
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
