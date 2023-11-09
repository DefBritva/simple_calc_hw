import 'package:flutter/material.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';

class AmountOfTipsTextWidget extends StatelessWidget {
  const AmountOfTipsTextWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: const Text(
        'Размер чаевых',
        style: Styles.appTextStyle,
      ),
    );
  }
}
