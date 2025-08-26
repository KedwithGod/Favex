import '../../../model/utilities/imports/generalImport.dart';

snackBarWidget(BuildContext context, {required String text, Color? color}) {
  SnackBar snackBar = SnackBar(
    content: InterText(
      text,
      noOfTextLine: 3,
      textFontSize: 10,
      textAlign: TextAlign.center,
    ),
    backgroundColor: colorsBucket!.white,
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
