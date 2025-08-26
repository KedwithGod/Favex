// * this function creates a combination of the text and
// * text field used in the project

import '../../../model/utilities/imports/generalImport.dart';

Widget textAndTextField(context,
    { TextInputType? textInputType,
    required TextEditingController controller,
    required String hint,
    required Function onChanged,
    required List<TextInputFormatter> inputFormatter,
    required bool errorTextActive,
    required FocusNode focusNode,
    Widget? prefix,
    required String errorText,
    double? height,
    double? borderRadius,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? obscureText,
    Color? borderColor,
    bool? enabled,
    double? width}) {
  return FormattedTextFields(
    keyInputType: textInputType?? TextInputType.text,
    textFieldController: controller,
    textFieldHint: hint,
    textFieldLineSpan: 1,
    height: height,
    width: width ,
    noBorder: false,
    autoFocus: false,
    inputFormatters: inputFormatter,
    onChangedFunction: (value){onChanged();},
    errorTextActive: errorTextActive,
    focusNode: focusNode,
    prefixIcon: prefixIcon,
    prefix: prefix,
    suffixIcon: suffixIcon,
    cursorColor:  colorsBucket!.borderBlack,
    obscureText: obscureText ?? false,
    hintColor: colorsBucket!.subtitle,
    outLineBorderColor: colorsBucket!.transparent,
    errorText:errorText,
   
  );
}
