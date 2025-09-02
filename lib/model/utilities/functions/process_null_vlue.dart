// to process null value
String nvl(String? value, [String? returnValue]) {
  if (value == null && returnValue != null) {
    return returnValue;
  } else if (value != null) {
    return value;
  } else {
    return "";
  }
}

List<String> generateGiftCardSteps(String rangeString) {
  try {
    final parts = rangeString.split('-');
    if (parts.length != 2) return [];

    final min = double.tryParse(parts[0].trim());
    final max = double.tryParse(parts[1].trim());

    if (min == null || max == null || min >= max) return [];

    final median = (min + max) / 2;

    

    return [min.toInt().toString(),median.toInt().toString(), max.toInt().toString(), 'others'];
  } catch (_) {
    return [];
  }
}
