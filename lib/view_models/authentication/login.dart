import '/model/utilities/imports/shared.dart';

class LoginViewModel extends BaseModel{

  // password
  



  // Function to revalidate all fields and store them in signUpBucket if valid
  void revalidateAllFields(context) {
    // Revalidate full name

    if (emailNotValid == true) {
      validateEmail();
    } else if (passwordNotValid == true) {
      validatePassword();
    }

    // If all fields are valid, store them in signUpBucket
    if (!emailErrorBool && !passwordNotValid) {
      //  call login function
      emailControllerBucket = emailController.text;
      router.goNamed(lockScreenPageRoute);
     
    }
  }



  
}
