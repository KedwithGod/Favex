import '../../../model/utilities/imports/generalImport.dart';

class ScreenSize {
  final BuildContext? context;
  ScreenSize({this.context});

  // screen height
  double get h => MediaQuery.of(context!).size.height;

  // screen width
  double get w => MediaQuery.of(context!).size.width;

  // size
  Size get s => MediaQuery.of(context!).size;
  // text scale factor
  TextScaler get tsf => MediaQuery.of(context!).textScaler;

  double removeWidthAdjustment() => (430 / MediaQuery.of(context!).size.width);

  // calculated height
  double cH({double? height}) =>
      MediaQuery.of(context!).size.height * (height! / 812);
  
//   double cH({double? height}) {
//   double screenHeight = MediaQuery.of(context!).size.height;

//   if (screenHeight <= 600) {
//     return screenHeight * (height! / 600);
//   } 
//   if (screenHeight >= 812) {
//     return screenHeight * (height! / 812);
//   } 
//   else if (screenHeight >= 1250) {
//     return screenHeight * (height! / 1250);
//   } 

//   return height!; // Default case
// }
  // calculated width
  double cW({double? width}) {
    if (MediaQuery.of(context!).size.width >= 730) {
      return MediaQuery.of(context!).size.width * (width! / 730);
    }
    else if (MediaQuery.of(context!).size.width >= 1250) {
      return MediaQuery.of(context!).size.width * (width! / 1250);
    }

    return MediaQuery.of(context!).size.width < 430
        ? MediaQuery.of(context!).size.width * (width! / 430)
        : width!;
  }
}
