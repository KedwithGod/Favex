import '../../../model/utilities/imports/shared.dart';


// rubik text
class InterText extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing, lineHeight;
  final FontWeight? textFontWeight;
  final int? noOfTextLine;
  final String? textSemanticLabel;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;
  final List<Shadow>? shadow;

  const InterText(
    this.inputText, {
    super.key,
    this.textDecoration,
    this.textColor,
    this.noOfTextLine,
    this.textFontSize,
    this.textFontWeight,
    this.textSemanticLabel,
    this.shadow,
    this.textAlign,
    this.decorationColor,
    this.letterSpacing,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor; // ✅ respect device scaling

    return Text(
      inputText,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: textColor ?? colorsBucket!.title,
          letterSpacing: letterSpacing ?? 0,
          shadows: shadow,
          fontSize: (textFontSize ?? 14) * scaleFactor, // ✅ scale properly
          fontWeight: textFontWeight ?? FontWeight.w400,
          height: lineHeight, // ✅ allow custom line height if needed
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? colorsBucket!.borderMid,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
      maxLines: noOfTextLine,
      overflow: noOfTextLine != null ? TextOverflow.ellipsis : null, // ✅ safe cut-off
      semanticsLabel: textSemanticLabel ?? inputText,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}

