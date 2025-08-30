// constants of string
// screen sizing

import '../../imports/shared.dart';




String triggeredFromString() {
  if (kIsWeb) {
    return 'web';
  } else {
    return 'mobile';
  }
}

// error string
const String networkError =
    'Unable to process request, check your network and try again later';
const String undefinedError = 'Error occurred, try gain later';
const String invalidBaseUrl = 'Unable to access host, invalid base url';
const String connectionTimeoutError =
    'The connection has timed out, please try again later.';
const String invalidAccountNumber =
    'The account number you entered is incorrect, kindly check again';
const String notificationRead = "Notification marked as read";
const String assetImagePlaceHolder = "assets/avatar.jpeg";
const String assetImagePlaceHolderRecipient = "assets/avatar2.png";
const String networkImagePlaceHolder =
    "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";
const String invalidPassword =
    'Invalid password, Length must be more than 7 and contains lower case, upper case , digit and  symbol';
const String isEmptyString = " must be filled";
const String serviceUnavailableError = "Service provider not available";

// string for RTS
// savedCard status
const String savedStatus = "Saved";

//
const String success = 'success';
const String failed = 'failed';
const String cardCharge = '5000';

// constant sizes
const double hPadding = 16;

// credit transaction list
const List<String> creditTransactionId = ['11', '14', '15', '16', '21'];

const int timeoutDuration = 30; 
