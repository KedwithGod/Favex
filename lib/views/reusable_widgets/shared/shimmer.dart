


import '/model/utilities/imports/shared.dart';

class ShimmerLoader extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;

  const ShimmerLoader({
    super.key,
    this.height = 16,
    this.width = double.infinity,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorsBucket!.backgroundMid,
      highlightColor: colorsBucket!.backgroundDisabled,
      child: GeneralContainer(
        height: height,
        width: width,
       
          color: colorsBucket!.backgroundMid,
          borderRadius: borderRadius,
        
      ),
    );
  }
}
