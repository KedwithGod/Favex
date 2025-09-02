import '../../../model/utilities/imports/shared.dart';

class ImageAvatar extends StatelessWidget {
  final String? image;
  final ImageTypeEnum? imageType;
  final Color? backgroundColor;
  final double imageRadius;
  final bool? isNetworkImage;

  // Make this a required parameter

  const ImageAvatar(
      {Key? key,
      this.image,
      this.imageType,
      this.imageRadius = 30.0,
      this.backgroundColor,
      this.isNetworkImage
      // Default radius value
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: imageRadius, // Set the radius for the CircleAvatar
      backgroundColor: backgroundColor ?? colorsBucket!.transparent,
      child: image == null
          ? GeneralIconDisplay(
              Icons.person, colorsBucket!.disabled, UniqueKey(), 18)
          : ClipOval(
              child: isNetworkImage == true
                  ? Image.network(
                      image!,
                      width: sS(context).cW(
                          width:
                              imageRadius * 2), // Adjust width for CircleAvatar
                      height: sS(context).cH(
                          height: imageRadius *
                              2), // Adjust height for CircleAvatar
                      fit: BoxFit.cover,
                    )
                  : (imageType == ImageTypeEnum.png
                      ? Image.asset(
                          'assets/pngs/$image.png',
                          width: sS(context).cW(
                              width: imageRadius *
                                  2), // Adjust width for CircleAvatar
                          height: sS(context).cH(
                              height: imageRadius *
                                  2), // Adjust height for CircleAvatar
                          fit: BoxFit.cover,
                        )
                      : WebsafeSvg.asset(
                          'assets/svgs/$image.svg',
                          width: sS(context).cW(
                              width: imageRadius *
                                  2), // Adjust width for CircleAvatar
                          height: sS(context).cH(
                              height: imageRadius *
                                  2), // Adjust height for CircleAvatar
                          fit: BoxFit.cover,
                        )),
            ),
    );
  }
}

class SvgPngImage extends StatelessWidget {
  final String path;
  final double height, width;
  final ColorFilter? colorFilter;
  final ImageTypeEnum? imageType;
  final bool? isNetworkImage;
  final BoxFit? boxfit;
  const SvgPngImage(
      {super.key,
      required this.path,
      required this.height,
      required this.width,
      this.colorFilter,
      this.imageType = ImageTypeEnum.svg,
      this.isNetworkImage,this.boxfit});

  @override
  Widget build(BuildContext context) {
    return isNetworkImage == true
        ? Image.network(
            path,
            width: sS(context).cW(width: width),
            height: sS(context).cH(height: height),
            fit: BoxFit.cover,
          )
        : (imageType == ImageTypeEnum.svg
            ? SvgPicture.asset(
                'assets/svgs/$path.svg',
                width: sS(context).cW(width: width),
                height: sS(context).cH(height: height),
                colorFilter: colorFilter,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/pngs/$path.png',
                width: sS(context).cW(width: width),
                height: sS(context).cH(height: height),
                fit:boxfit?? BoxFit.cover,
              ));
  }
}
