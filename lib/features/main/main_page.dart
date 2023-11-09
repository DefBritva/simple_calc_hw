import 'package:flutter/material.dart';
import 'package:simple_calc_hw/features/main/presentation/app_bar.dart';
import 'package:simple_calc_hw/features/main/presentation/body.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CalcAppBar(),
      body: CalcBody(),
    );
  }
}
