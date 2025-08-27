

import '../../../model/utilities/imports/shared.dart';

class ImageAvatar extends StatelessWidget {
  final String? image;
  final ImageTypeEnum? imageType;
  final double? width;
  final double? height; // Added height parameter
  final double imageRadius; // New imageRadius parameter

  const ImageAvatar({
    Key? key,
    this.image,
    this.imageType,
    this.width,
    this.height,
    this.imageRadius = 30.0, // Default radius value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: sS(context).cW(width: width ?? 60),
      height: sS(context).cH(height: height ?? 60),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: image == null
            ? Border.all(color: colorsBucket!.borderDisabled)
            : Border.all(width: 0),
      ),
      alignment: Alignment.center,
      child: image == null
          ? GeneralIconDisplay(
              Icons.person, colorsBucket!.disabled, UniqueKey(), 18)
          : ClipOval( // Clip the image to a circular shape
              child: imageType == ImageTypeEnum.png
                  ? Image.asset(
                      image!,
                      width: sS(context).cW(width:width ?? imageRadius * 2),
                      height: sS(context).cH(height:height ?? imageRadius * 2),
                      fit: BoxFit.cover, // Ensure the image covers the circle
                    )
                  : WebsafeSvg.asset(
                      image!,
                      width: sS(context).cW(width: width ?? imageRadius * 2),
                      height: sS(context).cH(height: height ?? imageRadius * 2),
                      fit: BoxFit.cover, // Ensure the image covers the circle
                    ),
            ),
    );
  }
}
class SvgImage extends StatelessWidget {
  final String path;
  final double height, width;
  final ColorFilter? colorFilter;
  const SvgImage(
      {super.key,
      required this.path,
      required this.height,
      required this.width, this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/$path.svg',
      width: sS(context).cW(width: width),
      height: sS(context).cH(height: height),
      colorFilter: colorFilter,
      fit: BoxFit.contain,
    );
  }
}
