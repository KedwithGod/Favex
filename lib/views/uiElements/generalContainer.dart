import '../../../model/utilities/imports/generalImport.dart';

class GeneralContainer extends StatelessWidget {
  final double height, width, borderWidth, borderRadius;
  final double topLeft, topRight, bottomLeft, bottomRight;
  final double left, right, bottom, top, allSide;
  final double leftMargin, topMargin, rightMargin, bottomMargin;
  final BorderStyle? borderStyle;
  final Color? color, borderColor;
  final bool noDecoration, noBorderRadius, isNetworkImage, allBorder;
  final BoxFit? boxFit;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;
  final bool? noAdaptivness;

  final String? image;
  final Widget? child;

  const GeneralContainer({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    this.noDecoration = false,
    this.borderWidth = 0,
    this.borderStyle,
    this.borderColor ,
    this.noBorderRadius = false,
    this.borderRadius = 0,
    this.child,
    this.image,
    this.boxFit,
    this.isNetworkImage = false,
    this.allBorder = true,
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
    this.boxShadow,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.allSide = 0,
    this.shape,
    this.leftMargin = 0,
    this.topMargin = 0,
    this.rightMargin = 0,
    this.bottomMargin = 0, this.noAdaptivness=false,
  });

  @override
  Widget build(BuildContext context) {
  
    // Calculate adaptive values
    final adaptiveHeight = sS(context).cH(height: height);
    final adaptiveWidth = sS(context).cW(width: width);
    final adaptiveBorderRadius = sS(context).cH(height: borderRadius);
    final adaptiveTopLeft = sS(context).cH(height: topLeft);
    final adaptiveTopRight = sS(context).cH(height: topRight);
    final adaptiveBottomLeft = sS(context).cH(height: bottomLeft);
    final adaptiveBottomRight = sS(context).cH(height: bottomRight);
   

    return Container(
      height:noAdaptivness==true?height: adaptiveHeight,
      width: noAdaptivness==true?width: adaptiveWidth,
      margin: EdgeInsets.fromLTRB(
        sS(context).cW(width: leftMargin),
        sS(context).cH(height: topMargin),
        sS(context).cW(width: rightMargin),
        sS(context).cH(height: bottomMargin),
      ),
      padding: EdgeInsets.fromLTRB(
        sS(context).cW(width: allSide != 0 ? allSide : left),
        sS(context).cH(height: allSide != 0 ? allSide : top),
        sS(context).cW(width: allSide != 0 ? allSide : right),
        sS(context).cH(height: allSide != 0 ? allSide : bottom),
      ),
      decoration: noDecoration
          ? BoxDecoration(color: color)
          : BoxDecoration(
            
              image: image != null
                  ? DecorationImage(
                      image: (isNetworkImage
                          ? NetworkImage(image!)
                          : AssetImage(image!) as ImageProvider),
                      fit: boxFit ?? BoxFit.contain,
                    )
                  : null,
              borderRadius: noBorderRadius
                  ? BorderRadius.zero
                  : (allBorder
                      ? BorderRadius.all(Radius.circular(adaptiveBorderRadius))
                      : BorderRadius.only(
                          topLeft: Radius.circular(adaptiveTopLeft),
                          topRight: Radius.circular(adaptiveTopRight),
                          bottomLeft: Radius.circular(adaptiveBottomLeft),
                          bottomRight: Radius.circular(adaptiveBottomRight),
                        )),
              color: color,
              boxShadow: boxShadow,
              
              border: Border.all(
                color: borderColor??colorsBucket!.borderMid,
                width: borderWidth,
                style: borderStyle ?? BorderStyle.solid,
              ),
            ),
      child: child,
    );
  }
}