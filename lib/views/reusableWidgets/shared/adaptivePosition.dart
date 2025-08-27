// adding row to adaption Positioned widget

import '../../../model/utilities/imports/generalImport.dart';

Widget rowPositioned(
    {required double top, required Widget child, double? left, double? right,double? bottom}) {
  final bool isLeftSet = left != null && left != 0;
  final bool isRightSet = right != null && right != 0;

  final MainAxisAlignment alignment = !isLeftSet && isRightSet
      ? MainAxisAlignment.end
      : isLeftSet && !isRightSet
          ? MainAxisAlignment.start
          : (!isLeftSet && !isRightSet)
              ? MainAxisAlignment.center
              : MainAxisAlignment.start;
  

  return AdaptivePositioned(
    Row(
      mainAxisAlignment: alignment,
      children: [
        Flexible(child: child),
      ],
    ),
    left: left ?? 0,
    right: right ?? 0,
    top: top,
    bottom: bottom,
    
  );
}
