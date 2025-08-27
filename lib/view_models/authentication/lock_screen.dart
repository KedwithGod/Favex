import '/model/utilities/imports/shared.dart';

class LockScreenViewModel extends BaseModel {
  bool pinErrorBool = false;
  String pinErrorText = 'Incorrect PIN. Try again';
  String testPin = '1234';
  String pin = '';

  onCompletePin(BuildContext context, inputPin) {
    pin = inputPin;
    if (inputPin != testPin) {
      pinErrorBool = true;
      notifyListeners();
      return;
    }
  // else navigate to dashboard
      context.goNamed(dashboardPageRoute);

    
  }

  onChangePin() {
    pinErrorBool = false;
    notifyListeners();

    
  }
}
