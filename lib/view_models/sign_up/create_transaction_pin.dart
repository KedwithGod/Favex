import 'package:favex/model/utilities/imports/shared.dart';

class CreateTransactionPinViewModel extends BaseModel {
  bool pinErrorBool = false;
  String pinErrorText = '';

  String confirmPin = '';

  onCompletePin(BuildContext context, inputPin) {
    pinBucket = inputPin;
    notifyListeners();
    context.goNamed(confirmTransactionPinPageRoute);
  }

  onChangePin() {
    pinErrorBool = false;
    notifyListeners();
  }

  onConfirmCompletePin(BuildContext context, inputPin) {
    confirmPin = inputPin;
    if (confirmPin != pinBucket) {
      pinErrorBool = true;
      pinErrorText = textBucket!.pinNotMatchError;
      notifyListeners();
    } else {
      setTransactionPinFunction(context);
    }
  }

  Future<void> setTransactionPinFunction(BuildContext context
      // fallback if userId not provided
      ) async {
    await runFunctionForApi(
      context,
      functionToRunService: networkService.postRequest(
        context,
        setTransactionPinUrl, // e.g. "/v1/pin/set"
        {
          'user_id':null,
          "email": emailControllerBucket,
          "txn_pin": confirmPin,
        },
        (data) => data,
      ),
      functionToRunAfterService: (result) async {
        final GeneralResponse response = result;

        if (response.success) {
          ConfirmationSheet.show(
            context,
            title: textBucket!.transactionPinCreated,
            subtitle: textBucket!.pinCreatedSuccessfully,
            onPressed: () {
              router.goNamed(enableBiometricPageRoute);
            },
          );
        } else {
          snackBarWidget(
            context,
            text: response.error.toString(),
            title: textBucket!.pinSetupFailed,
          );
        }
      },
    );
  }
}
