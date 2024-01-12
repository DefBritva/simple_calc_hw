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
    final ScrollController scrollController = ScrollController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: CustomScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
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
                      CalculateButton(
                        inputController: _inputController,
                        scrollController: scrollController,
                      ),
                      SizedBox(height: height * 0.05),
                      const ResultTextWidget(),
                      SizedBox(height: height * 0.01),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: ResultTipWidget(),
                      ),
                    ],
                  ),
                ),
                // Проверяет скрыта клавиатура или нет (== 0 значит скрыта)
                MediaQuery.of(context).viewInsets.bottom != 0
                    ? const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 500,
                        ),
                      )
                    : const SliverToBoxAdapter(
                        child: SizedBox(),
                      )
              ],
            ),
          ),
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
