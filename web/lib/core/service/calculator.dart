class TipCalculator {
  String calculateTip(String amount, int percent) {
    final int intAmount = int.tryParse(amount) ?? -1;
    if (amount.startsWith('0')) {
      return '';
    }
    if (intAmount < 0) {
      return '';
    } else if (percent == 0) {
      return intAmount.toString();
    } else {
      return (intAmount + (intAmount / 100 * percent)).round().toString();
    }
  }
}
