

import '/model/utilities/imports/shared.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

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