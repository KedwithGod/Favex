import '../../../model/utilities/imports/shared.dart';

void snackBarWidget(
  BuildContext context, {
  required String text,
  String? title,
  Color? color,
  VoidCallback? action, // Add an optional callback parameter
}) {
  Flushbar(
    backgroundColor: color ?? colorsBucket!.backgroundMid,
    title: title ?? '',
    titleColor: colorsBucket!.primary,
    messageColor: colorsBucket!.title,
    message: text,
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(seconds: 2),
    padding: EdgeInsets.symmetric(
      horizontal: sS(context).cW(width: 30),
      vertical: sS(context).cH(height: 16),
    ),
  ).show(context).then((_) {
    print('next action');
    // Execute the action if provided
    if (action != null) {
      print('action');
      action();
    }
  });
}

void loadingSnackBarWidget(BuildContext context,
  {String? text}
){
  Flushbar(
    backgroundColor: colorsBucket!.backgroundMid,
    messageText: Row(
      children: [
         SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colorsBucket!.primary),
          ),
        ),
         S(w: 16),
        InterText(
          text ?? "Loading...",
          
        ),
      ],
    ),
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(days: 1), // stays until dismissed
    padding: const EdgeInsets.all(16),
    isDismissible: false,
  ).show(context);
}