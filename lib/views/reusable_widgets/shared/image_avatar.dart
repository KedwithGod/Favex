

import '../../../model/utilities/imports/shared.dart';



class ImageAvatar extends StatelessWidget {
  final String? image;
  final ImageTypeEnum? imageType;
  final double imageRadius; // Make this a required parameter

  const ImageAvatar({
    Key? key,
    this.image,
    this.imageType,
    this.imageRadius = 30.0, // Default radius value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: imageRadius, // Set the radius for the CircleAvatar
      backgroundColor: image == null ? colorsBucket!.borderDisabled : Colors.transparent,
      child: image == null
          ? GeneralIconDisplay(
              Icons.person, colorsBucket!.disabled, UniqueKey(), 18)
          : ClipOval(
              child: imageType == ImageTypeEnum.png
                  ? Image.asset(
                       'assets/pngs/$image.png',
                      width: imageRadius * 2, // Adjust width for CircleAvatar
                      height: imageRadius * 2, // Adjust height for CircleAvatar
                      fit: BoxFit.cover,
                    )
                  : WebsafeSvg.asset(
                       'assets/svgs/$image.svg',
                      width: imageRadius * 2, // Adjust width for CircleAvatar
                      height: imageRadius * 2, // Adjust height for CircleAvatar
                      fit: BoxFit.cover,
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
