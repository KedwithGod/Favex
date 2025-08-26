

import '../imports/generalImport.dart';

double measureTextWidth(BuildContext context, String text, {double? fontsize}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
        text: text,
        style: TextStyle(fontSize: sS(context).cH(height: fontsize ?? 12.0))),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout();

  return textPainter.width;
}
