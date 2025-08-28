import '../imports/shared.dart';

Future<String> determineInitialRoute() async {

  String? token = await LocalStorage.getString(tokenKeyPS);

  if ( token != null && token.isNotEmpty) {
    print('User has valid token, checking admin status');
    tokenKeyBucket = token;
    isLoggedInBucket = true;
    }

    // Check if user is admin by looking at user data
  return '/create_password';
}
