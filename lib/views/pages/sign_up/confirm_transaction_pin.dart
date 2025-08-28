

import '/model/utilities/imports/shared.dart';

class ConfirmTransactonPage extends StatelessWidget {
  const ConfirmTransactonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateTransactionPinViewModel>.reactive(
        viewModelBuilder: () => CreateTransactionPinViewModel(),
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
                            currentStep: 4,
                          ),

                          S(h: 30),
                          InterText(textBucket!.setTransactionPin),

                          S(h: 20),
                          // forgot password text
                          InterText(
                            textBucket!.confirmTransactionPin,
                            textFontSize: 16,
                            textFontWeight: FontWeight.w600,
                          ),
                          //  subtitle
                          S(h: 12),
                          S(
                              w: 237,
                              h: 32,
                              child: InterText(
                                textBucket!.enterTransactionPinAgain,
                                textFontSize: 12,
                                textAlign: TextAlign.center,
                                noOfTextLine: 2,
                              )),
                          S(h: 20),
                          PinCodeFields(
                              length: 4,
                              onChanged: (code) {
                                print("Current code: $code");
                                model.onChangePin();
                              },
                              onCompleted: (code) {
                                print("Completed PIN: $code");
                                model.onConfirmCompletePin(context,code);
                              }, errorTextActive: model.pinErrorBool,
                              errortext: model.pinErrorText,
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