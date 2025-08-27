import '../../../model/utilities/imports/shared.dart';

Widget loading({Color? color}) {
  return S(
    h: 45,
    w: 45,
    child: CircularProgressIndicator(
        strokeWidth: 5.5,
        valueColor: AlwaysStoppedAnimation<Color>(color ??  colorsBucket!.white),
        backgroundColor:  colorsBucket!.primary),
  );
}
