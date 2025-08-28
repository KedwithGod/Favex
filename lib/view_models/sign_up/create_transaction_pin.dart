import 'package:favex/model/utilities/imports/shared.dart';

class CreateTransactionPinViewModel extends BaseModel{
    bool pinErrorBool = false;
  String pinErrorText = '';


  String confirmPin ='';

  onCompletePin(BuildContext context, inputPin) {
    pinBucket = inputPin;
    notifyListeners();
    context.goNamed(confirmTransactionPinPage);

    
  }

  onChangePin() {
    pinErrorBool = false;
    notifyListeners();

    
  }
  onConfirmCompletePin(BuildContext context, inputPin) {
    confirmPin = inputPin;
    if(confirmPin !=pinBucket){
      pinErrorBool = true;
      pinErrorText = textBucket!.pinNotMatchError;
      notifyListeners();
    }
    else{
        ConfirmationSheet.show(
              context,
              title: textBucket!.transactionPinCreated,
              subtitle:textBucket!.pinCreatedSuccessfully,
              onPressed: () {
                router.goNamed(enableBiometricPage);
              },
            );
    }
    
  }
}