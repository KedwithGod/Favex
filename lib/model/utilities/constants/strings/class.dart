// instantiate classes


import '../../imports/generalImport.dart';

ScreenSize sS(
  BuildContext context,
) =>
    ScreenSize(context: context);

NetworkService networkService = NetworkService();
AuthenticatedNetworkService authenticatedNetworkService =
    AuthenticatedNetworkService();
LocalAuthentication auth = LocalAuthentication();
BaseModel baseModel = BaseModel();
LocalStorage localStorage = LocalStorage();
