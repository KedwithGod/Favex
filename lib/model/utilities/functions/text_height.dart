// calculate text height
import '../imports/shared.dart';

double calculateErrorTextHeight(String errorText, BuildContext context) {
  if (errorText.isEmpty) {
   
    return 0.0;
  }
  final TextPainter textPainter = TextPainter(
    text:
        TextSpan(text: errorText, style: Theme.of(context).textTheme.bodyMedium),
    textDirection: TextDirection.ltr,
    maxLines: null,
  )..layout(
      maxWidth:
          MediaQuery.of(context).size.width - 40); // Adjust width as necessary
  return textPainter.size.height;
}
