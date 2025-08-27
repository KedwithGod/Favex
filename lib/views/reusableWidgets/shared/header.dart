import '../../../model/utilities/imports/generalImport.dart';

Widget header(BuildContext context, String text,
    {String? navigateTo,
    double? top,
    Widget? widget,
    MainAxisAlignment? mainAxisAlignment}) {
  return rowPositioned(
      child: S(
        h: 30,
        w: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            Row(
              children: [
                backButtonNoPositioned(context,
                    navigateTo: navigateTo ?? backButtonRedirectBucket),
                S(w: 10),
                S(
                  w: 180,
                  h: 25,
                  child: InterText(
                    text,
                     textColor:colorsBucket!.title,
                    textFontSize: 18,
                    letterSpacing: 0.18,
                  ),
                ),
              ],
            ),
            if (widget != null) ...[widget]
          ],
        ),
      ),
      top: top ?? 60,
    );
}

Widget subHeading(BuildContext context, String text) {
  return rowPositioned(
      top: 110,
      left: 15,
      child:
          InterText(text,  textColor:colorsBucket!.subtitle, textFontSize: 16,noOfTextLine: 2));
}


