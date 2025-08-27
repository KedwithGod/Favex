

import '../../../model/utilities/imports/shared.dart';

class LockScreenPage extends StatelessWidget {
  const LockScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LockScreenViewModel>.reactive(
        viewModelBuilder: () => LockScreenViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(
            children: [
              rowPositioned(
                  top: 20,
                  bottom: 20,
                  child: S(
                    h: 728,
                    w: 335,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // logo
                          const ImageAvatar(
                            imageType: ImageTypeEnum.png,
                            image: 'avatar',
                            imageRadius: 55,
                          
                          ),
                          S(h: 20),
                          // hi
                          InterText(
                            "${textBucket!.hi}@${model.testUser}",
                            textFontSize: 18,
                            textFontWeight: FontWeight.w700,
                          ),
                          S(h: 10),
                          // enter pin subtitle
                          InterText(
                            textBucket!.enterPin,
                            textFontSize: 12,
                            textColor: colorsBucket!.subtitle,
                          ),
                          S(h: 30),

                          // text field
                          S(
                            w: 249, h:440,
                            child: PinCodeFields(
                              length: 4,
                              onChanged: (code) {
                                print("Current code: $code");
                                model.onChangePin();
                              },
                              onCompleted: (code) {
                                print("Completed PIN: $code");
                                model.onCompletePin(context,code);
                              }, errorTextActive: model.pinErrorBool,
                              errortext: model.pinErrorText,
                            ),
                          ),
                          // sign up
                          S(h: 30),
                          GestureDetector(
                            onTap: () {
                              context.goNamed(verifyEmailPageRoute);
                            },
                            child: InterText(
                              textBucket!.iAmNot + model.testUser,
                              textFontSize: 12,
                              textColor: colorsBucket!.primary,
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
