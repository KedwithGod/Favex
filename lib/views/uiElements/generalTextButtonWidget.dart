
import '../../../model/utilities/imports/generalImport.dart';

class TextButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Color overlayColor;
  final Widget child;

  const TextButtonWidget({super.key, 
    required this.onPressed,
    required this.child,
    required this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style:const ButtonStyle(
          // overlayColor: WidgetStateProperty.all(overlayColor.withOpacity(0.25)),
          // padding: WidgetStateProperty.all(EdgeInsets.zero),
          // minimumSize: WidgetStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          onPressed();
        },
        child: child);
  }
}
