
import '/model/utilities/imports/shared.dart';

class LoginViewModel extends BaseModel{

  // password
  


// login function


  // login function
// login function
Future<void> loginFunction(BuildContext context) async {
  await runFunctionForApi(
    context,
    functionToRunService: networkService.postRequest(
      context,
      loginUrl,
      {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      },
      (data) => data, // raw map, handled below
    ),
    functionToRunAfterService: (result) async {
      final GeneralResponse response = result;

      // ✅ at this point response.success is guaranteed to be true

      final Map<String, dynamic> jsonData = response.data[0];
      print("Login response: $jsonData");

      // adapt to your AuthResponse model
      final AuthResponse loginResponse = AuthResponse.fromJson(jsonData);

      if (loginResponse.user != null) {
        // persist token & user
        await LocalStorage.setString(tokenKeyPS, loginResponse.token ?? "");
        await LocalStorage.setString(
          userDataPS,
          jsonEncode(loginResponse.user!.toJson()),
        );

        // set globals
        backButtonRedirectBucket = '';
        isLoggedInBucket = true;

        // navigate to home
        router.goNamed(homePageRoute);
      } else {
        snackBarWidget(context, text: "No user data returned", color: Colors.red);
      }
    },
  );
}


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
      loginFunction(context);
     
    }
  }



  
}
