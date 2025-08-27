import '../../../model/utilities/imports/generalImport.dart';

Widget textAndSearchField(context,
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String hint,
    required String labelText,
    required Function onChanged,
    required List<TextInputFormatter> inputFormatter,
    required bool errorTextActive,
    required FocusNode focusNode,
    required String textFieldLabel,
    required Color outLineBorderColor,
    Widget? prefix,
    Widget? suffixIcon,
    double? height,
    required Widget? prefixIcon,
    double? borderRadius,
    bool? obscureText,
    Color? borderColor,
    bool? enabled,
    double? width}) {
  return FormattedTextFields(
    keyInputType: textInputType,
    textFieldController: controller,
    textFieldHint: hint,
    textFieldLineSpan: 1,
    height: height ?? 52,
    width: width ?? 430,
    containerColor: colorsBucket!.backgroundMid,
    noBorder: false,
    autoFocus: false,
    inputFormatters: inputFormatter,
    onChangedFunction: (onChange) {},
    errorTextActive: errorTextActive,
    focusNode: focusNode,
    prefixIcon: prefixIcon,
    prefix: prefix,
    suffixIcon: suffixIcon,
    textFont: 15,
    hintFont: 14,
    borderRadius: 10,
    cursorColor:  colorsBucket!.borderBlack,
    obscureText: obscureText ?? false,
    hintColor:  colorsBucket!.subtitle,
    outLineBorderColor: outLineBorderColor,
    focusBorderColor: errorTextActive ? colorsBucket!.transparent : colorsBucket!.borderMid,
    textFontWeight: FontWeight.w500,
    hintFontWeight: FontWeight.w400,
    contentPadding: EdgeInsets.only(
        left: sS(context).cW(width: 16),
        right: sS(context).cW(width: 16),
        top: sS(context).cH(height: 16),
        bottom: sS(context).cH(height: 15)),
    labelFont: 15,
    labelColor: colorsBucket!.title,
    labelFontWeight: FontWeight.w600,
  );
}

// search prefix icon
class SearchPrefix extends StatelessWidget {
  const SearchPrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      height: 52,
      width: 44,
      color:  colorsBucket!.primary,
      allBorder: false,
      noBorderRadius: false,
      topLeft: 8,
      bottomLeft: 8,
      rightMargin: 22,
      child: Center(
          child:
              GeneralIconDisplay(Icons.search_sharp,  colorsBucket!.white, UniqueKey(), 25)),
    );
  }
}

