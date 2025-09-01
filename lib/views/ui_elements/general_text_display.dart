import '../../../model/utilities/imports/shared.dart';


// rubik text

class InterText extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight? textFontWeight;
  final int? noOfTextLine;
  final String? textSemanticLabel;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;
  final List<Shadow>? shadow;

  const InterText(this.inputText,
      {super.key,
      this.textDecoration,
      this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      this.shadow,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {

    return Text(
      inputText,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
              // add line height to the text widget if the design look different
              color: textColor??colorsBucket!.title,
              letterSpacing: letterSpacing ?? 0,
              shadows: shadow,
               fontSize: sS(context).tsf.scale((textFontSize??14)*1.3),
              fontWeight: textFontWeight?? FontWeight.w400,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: decorationColor ?? colorsBucket!.borderMid,
              decorationStyle: TextDecorationStyle.solid)),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel??inputText,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}

// text span\
