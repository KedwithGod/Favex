import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/utilities/imports/shared.dart';

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
    final scaleFactor = MediaQuery.of(context).textScaler;

    // ✅ On iOS, boost the base font size a bit
    final adjustedFontSize = (textFontSize ?? 14) *
        (defaultTargetPlatform == TargetPlatform.iOS ? 1.15 : 1.0);

    return Text(
      inputText,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: textColor ?? colorsBucket!.title,
          letterSpacing: letterSpacing ?? 0,
          shadows: shadow,
          fontSize: adjustedFontSize, // ✅ already adjusted
          fontWeight: textFontWeight ?? FontWeight.w400,
          height: lineHeight, // ✅ custom line height if passed
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? colorsBucket!.borderMid,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
      textScaler: scaleFactor, // ✅ let Flutter handle accessibility scaling
      maxLines: noOfTextLine,
      overflow: noOfTextLine != null ? TextOverflow.ellipsis : null,
      semanticsLabel: textSemanticLabel ?? inputText,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
