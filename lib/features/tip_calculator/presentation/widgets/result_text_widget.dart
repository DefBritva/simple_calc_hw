import 'package:flutter/material.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Итоговая сумма',
      style: Styles.appTextStyle,
    );
  }
}
