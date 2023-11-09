class TipCalculator {
  String calculateTip(String number, int percent) {
    final int intNumber = int.tryParse(number) ?? -1;
    if (number.startsWith('0')) {
      return '';
    }
    if (intNumber < 0) {
      return '';
    } else {
      return (intNumber / 100 * percent).round().toString();
    }
  }
}
