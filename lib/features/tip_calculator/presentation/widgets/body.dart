import 'package:flutter/material.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/amount_of_tips_text_widget.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/calculate_button.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/percents_widget.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/result_text_widget.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/result_tip_widget.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/user_input_widget.dart';

class CalcBody extends StatefulWidget {
  const CalcBody({super.key});

  @override
  State<CalcBody> createState() => _CalcBodyState();
}

class _CalcBodyState extends State<CalcBody> {
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: height * 0.025),
            UserInputWidget(
              height: height,
              width: width,
              inputController: _inputController,
            ),
            AmountOfTipsTextWidget(height: height),
            const PercentsWidget(),
            SizedBox(height: height > 599 ? height * 0.07 : 0),
            CalculateButton(inputController: _inputController),
            SizedBox(height: height > 599 ? height * 0.05 : height * 0.01),
            const ResultTextWidget(),
            SizedBox(height: height * 0.01),
            const ResultTipWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
