// creating extension in flutter
import '../imports/shared.dart';

extension E on String {
  String lastChars(int n) => substring(length - n);
}

extension CapitalizeFirstLetter on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension IntExtensions on int {
  ///returns a String with leading zeros.
  ///1 would be with the [numberOfTotalDigits] = 3 lead to a string '001'
  String addLeadingZeros(int numberOfTotalDigits) =>
      toString().padLeft(numberOfTotalDigits, '0');
}

extension TabEnumExtension on TabEnum {
  String get route {
    switch (this) {
      case TabEnum.home:
        return HomePageRoute; // Define your routes
      case TabEnum.history:
        return HomePageRoute;
      case TabEnum.card:
        return HomePageRoute;
      case TabEnum.rate:
        return HomePageRoute;
      case TabEnum.account:
        return HomePageRoute;
    }
  }
}