
import '../../../model/utilities/imports/generalImport.dart';

Widget actionBottomSheet(
    {required BuildContext context,
    Function? callback,
    required String title,
    required String subtitle,
    required String buttonText,
    required Color buttonColor,
    required String cancelText,
    int? noOfLineForSubtitle,
    Function? onCancelFunction,
    bool isImportant = false,
    Color? importantColor,
    double height = 260,
    double? subtitleHeight,
    Widget? additional}) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setter) {
    return Container(
      padding: EdgeInsets.only(
        top: sS(context).cH(height: 24),
        left: sS(context).cW(width: 16),
        right: sS(context).cW(width: 16),
      ),
      decoration:  BoxDecoration(
        color: colorsBucket!.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            if (isImportant) ...[
              SvgPicture.asset(
                'assets/info.svg',
                color: importantColor,
                height: sS(context).cH(height: 40),
              ),
              S(h: 24)
            ],
            InterText(
              title,
             textColor:   colorsBucket!.title,
             
             textFontSize:  20,
             textFontWeight:  FontWeight.w500,
             
              textAlign: TextAlign.center,
            ),
            S(h: 16),
            S(
              w: 358,
              h: ((subtitle.length/50)*18).roundToDouble(),
              child: InterText(
                subtitle,
                textColor:  colorsBucket!.backgroundDisabled,
                noOfTextLine: (subtitle.length/40.0).ceil(),
                textAlign: TextAlign.justify,
              ),
            ),
            additional ?? Container(),
            S(h: 16),
            const Divider(),
            S(h: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonNoPositioned(context,
                    text: cancelText,
                    textColor:  colorsBucket!.disabled,
                    buttonColor:  colorsBucket!.borderDisabled,
                    width: 170, navigator: () {
                  if (onCancelFunction == null) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                    onCancelFunction();
                  }
                }),
                buttonNoPositioned(context,
                    text: buttonText,
                    widget: InterText(
                        buttonText,  textColor:colorsBucket!.white, textFontWeight:  FontWeight.w500,),
                    textColor:  colorsBucket!.white,
                    buttonColor: buttonColor,
                    width: 170, navigator: () {
                  if (callback == null) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                    callback();
                  }
                }),
              ],
            ),
            S(h: 36)
          ],
        ),
      ),
    );
  });
}
