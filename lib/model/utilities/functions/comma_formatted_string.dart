// function to format a number with comma
import 'package:intl/intl.dart';

displayWithComma(String value) {
  if(double.tryParse(value) == null ){
    return value;
  }
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  mathFunc(Match match) => '${match[1]},';
  String result = value.replaceAllMapped(reg, mathFunc);
  /* print('$value -> $result');*/
  return result;
}

String? formatAmount(dynamic value,
    {String? sign = '₦', bool enableDecimal = true}) {
  if (value == null) {
    return null;
  } else {
    var formatter = enableDecimal
        ? NumberFormat("#,##0.00", "en_US")
        : NumberFormat("#,##0", "en_US");
    if (value is double) {
      String formattedAmount = formatter.format(value);
      return "$sign$formattedAmount";
    } else {
      double amount = double.parse(value);
      String formattedAmount = formatter.format(amount);
      return "$sign$formattedAmount";
    }
  }
}
