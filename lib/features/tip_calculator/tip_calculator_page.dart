import 'package:flutter/material.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/app_bar.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/body.dart';

class TipCalculatorPage extends StatelessWidget {
  const TipCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CalcAppBar(),
      body: CalcBody(),
    );
  }
}
