// this is the type of button used across the application



import '../../../model/utilities/imports/generalImport.dart';

// is to be used in stack widget
Widget button(context,
    {required String text,
    required double top,
    String? navigateTo,
    double? radius,
    Color? buttonColor,
    Color? textColor,
    Function? navigator,
     double? fontSize,
    double? width,
    FontWeight? fontWeight,
    double? right,
    Widget? widget,
    double? height}) {
  return Stack(
    children: [
      rowPositioned(
        child: ButtonWidget(
            navigator ??
                () {
                  // know your customer page
                  Navigator.pushNamed(context, navigateTo ?? '');
                },
            buttonColor ??  colorsBucket!.primary,
            width ?? 297,
            height ?? 52,
            widget ??
                 InterText(text,textColor: textColor ??  colorsBucket!.titleSoft,textFontSize:  fontSize??14,
           textFontWeight:  fontWeight ?? FontWeight.w400,textAlign: TextAlign.center,),
            Alignment.center,
            radius ?? 8),
        top: top,
      )
    ],
  );
}

// is to be used in column, rows and other grid element
Widget buttonNoPositioned(BuildContext context,
    { String? text='No text',
    String? navigateTo,
    double? radius,
    Color? buttonColor,
    Color? textColor,Color?  borderColor,
    Function? navigator,
    double? width,
    FontWeight? fontWeight,
    double? fontSize,
    Widget? widget,
    double? height}) {
  return ButtonWidget(
    navigator??
        () {
          // know your customer page
          if (navigateTo != null) {
            // set the back button route
            backButtonRedirectBucket=navigateTo;
            context.goNamed(navigateTo);
          }
        },
        
    buttonColor ??  colorsBucket!.primary,
    width ?? 400,
    height ?? 47,
    widget ??
        InterText(text!,textColor: textColor ??  colorsBucket!.titleSoft,textFontSize:  fontSize??14,
           textFontWeight:  fontWeight ?? FontWeight.w400,textAlign: TextAlign.center,),
    Alignment.center,
    radius ?? 10,
    noElevation: 0,
    borderColor: borderColor,
    
  );
}
