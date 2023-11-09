class TipCalculator {
  String calculateTip(String number, int percent) {
    final int intNumber = int.tryParse(number) ?? -1;
    if (intNumber < 0) {
      return '';
    } else {
      return (intNumber / 100 * percent).round().toString();
    }
  }
}
