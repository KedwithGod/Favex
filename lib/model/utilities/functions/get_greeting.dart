import '/model/utilities/imports/shared.dart';

String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return textBucket!.goodMorning;
  } else if (hour < 17) {
    return "Good afternoon";
  } else {
    return "Good evening";
  }
}
