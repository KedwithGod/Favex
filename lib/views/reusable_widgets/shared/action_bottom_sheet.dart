import 'package:favex/model/utilities/imports/shared.dart';

class ConfirmationSheet {
  static void show(
    BuildContext context, {
    Widget? image,
    String? title,
    String? subtitle,
    String? buttonText,
    required VoidCallback onPressed,
  }) {
    const defaultImage =
        SvgPngImage(path: 'success', height: 123, width: 162, imageType: ImageTypeEnum.png,);

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        S(h: 64),
        image ?? defaultImage,
        S(h: 20),
        // eneter otp
        InterText(
         title?? textBucket!.otpVerified,
          textFontSize: 18,
          textFontWeight: FontWeight.w700,
        ),

        S(h: 8),
        // eneter otp
        InterText(
         subtitle?? textBucket!.verificationCompletedPassword,
          textFontSize: 12,
          noOfTextLine: 2,
          textAlign: TextAlign.center,
        ),
         S(h: 20),
         buttonNoPositioned(context, text: buttonText?? textBucket!.continueText, navigator: onPressed),
         S(h: 64),
      ],
    );

    final isDesktop = MediaQuery.of(context).size.width > 600;

    if (isDesktop) {
      // Show dialog
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: content,
        ),
      );
    } else {
      // Show bottom sheet
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        isScrollControlled: true,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(20),
          child: content,
        ),
      );
    }
  }
}
