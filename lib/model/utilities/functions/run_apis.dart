import '../imports/generalImport.dart';

Future<bool> runFunctionForApi(
  BuildContext context, {
  required Future functionToRunService,
  bool noLoading = false,
  required Function(dynamic) functionToRunAfterService,
}) async {
  try {
    if (noLoading == false) loadingDialog(context, text: "");

    final value = await functionToRunService;
    if (!noLoading) Navigator.pop(context);
    functionToRunAfterService(value);
    return true;
  } catch (onError, stackTrace) {
    print(onError);
    if (noLoading == false) Navigator.pop(context);
    handleError(context, onError, stackTrace, noLoading);
    return false;
  }
}

void handleError(BuildContext context, dynamic onError, StackTrace stackTrace,
    bool noLoading) {
  if (onError is SocketException) {
    snackBarWidget(context, text: networkError);
  } else if (onError is FormatException) {
    debugPrint(onError.toString());
    if (onError.toString().contains('<!DOCTYPE html>')) {
      snackBarWidget(context,
          text:
              'API endpoints not configured on server. Please set up Laravel API routes.',
      );
    } else {
      snackBarWidget(context,text: '');
    }
  } else {
    debugPrint('stacktrace is $onError $stackTrace');
    // Normalize Exception payloads thrown by NetworkService
    Map<String, dynamic>? errorMap;
    try {
      final raw = onError.toString().replaceAll('Exception: ', '');
      errorMap = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {}

    if (errorMap != null) {
      final String title = (errorMap['title'] ?? 'Error').toString();
      final String message = (errorMap['message'] ?? undefinedError).toString();
      final int? code = int.tryParse('${errorMap['code'] ?? ''}');

      // Handle 402: Unverified Email during login
      if (code == 402 || title.toLowerCase().contains('unverified')) {
     
      }

     

      snackBarWidget(context, text: message, );
    } else {
      snackBarWidget(context, text: undefinedError);
    }
  }
}


