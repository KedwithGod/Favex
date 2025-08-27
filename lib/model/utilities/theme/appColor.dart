


import '../imports/shared.dart';

class AppColors {
  // common colors (don’t change across themes)
  static const black = Colors.black;
  static const red = Colors.red;
  static const yellow = Colors.yellow;
  final Color transparent = Colors.transparent;


  // theme-specific colors
  final Color title;
  final Color titleSoft;
  final Color subtitle;
  final Color backgroundMid;
  final Color primary;
  final Color backgroundDisabled;
  final Color borderMid;
  final Color borderDisabled;
  final Color alertHard;
  final Color white;
  final Color primaryLemon;
  final Color primarySoft;
  final Color borderBlack;
  final Color disabled;



  const AppColors({
    required this.title,
    required this.titleSoft,
    required this.subtitle,
    required this.backgroundMid,
    required this.primary,
    required this.backgroundDisabled,
    required this.borderMid,
    required this.borderDisabled,
    required this.alertHard,
    required this.primaryLemon,
    required this.primarySoft,
     required this.white,required this.borderBlack,required  this.disabled
  });

  // Light Theme
  static const AppColors light = AppColors(
    disabled: Color.fromRGBO(208, 213, 221, 1),
    white: Colors.white,
    title: Color.fromRGBO(16, 24, 40, 1),
    titleSoft: Color.fromRGBO(249, 250, 251, 1),
    subtitle: Color.fromRGBO(102, 112, 133, 1),
    backgroundMid: Color.fromRGBO(249, 250, 251, 1),
    primary: Color.fromRGBO(29, 106, 75, 1),
    backgroundDisabled: Color.fromRGBO(208, 213, 221, 1),
    borderMid: Color.fromRGBO(142, 155, 167, 1),
    borderDisabled: Color.fromRGBO(242, 242, 247, 1),
    alertHard: Color.fromRGBO(248, 52, 70, 1),
    primaryLemon: Color.fromRGBO(235, 248, 238, 1),
    primarySoft: Color.fromRGBO(249, 250, 251, 1),
    borderBlack: Color.fromRGBO(21, 27, 31, 1)
    
  );

  // Dark Theme (your values can be tuned)
  static const AppColors dark = AppColors(
   disabled: Color.fromRGBO(75, 85, 99, 1), // Darker shade for disabled
    white: Colors.black,
    titleSoft: Color.fromRGBO(200, 200, 200, 1),
    title: Color.fromRGBO(255, 255, 255, 1), // White for title
    subtitle: Color.fromRGBO(189, 197, 204, 1), // Light gray for subtitle
    backgroundMid: Color.fromRGBO(18, 18, 18, 1), // Dark background
    primary: Color.fromRGBO(29, 106, 75, 1), // Primary color
    backgroundDisabled: Color.fromRGBO(50, 50, 50, 1), // Darker disabled background
    borderMid: Color.fromRGBO(100, 110, 120, 1), // Mid border color
    borderDisabled: Color.fromRGBO(80, 80, 80, 1), // Darker border for disabled
    alertHard: Color.fromRGBO(248, 52, 70, 1), // Keep alert color
    primaryLemon: Color.fromRGBO(70, 70, 70, 1), // Darker shade for primary lemon
    primarySoft: Color.fromRGBO(34, 43, 36, 1), // Keep primary soft color
    borderBlack: Color.fromRGBO(255, 255, 255, 0.1), // Light border for contrast
 
    
  );
}
