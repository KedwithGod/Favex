import '../../../model/utilities/imports/generalImport.dart';

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