import '/model/utilities/imports/shared.dart';

class EmailEntryViewModel extends BaseModel{


  sendOtp(BuildContext context){
    //  function to resend otp
    snackBarWidget(context, text: textBucket!.otpSentEmailSuccess, title: textBucket!.otpVerification);
  }

}