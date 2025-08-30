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
    // Split "55-500" into [55, 500]
    final parts = rangeString.split('-');
    if (parts.length != 2) return [];

    final min = double.tryParse(parts[0].trim());
    final max = double.tryParse(parts[1].trim());

    if (min == null || max == null || min >= max) return [];

    // Generate 5 steps (min + 3 evenly spaced + max)
    final step = (max - min) / 4;

    return List.generate(5, (i) => (min + step * i).roundToDouble().toInt().toString());
  } catch (_) {
    return [];
  }
}