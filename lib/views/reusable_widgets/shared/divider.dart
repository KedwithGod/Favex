import '../../../model/utilities/imports/shared.dart';

class DividerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const DividerWidget({Key? key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(color: color??colorsBucket!.borderDisabled,
    height: height??1.0,
    width: width?? 335,
    );
  }
}
