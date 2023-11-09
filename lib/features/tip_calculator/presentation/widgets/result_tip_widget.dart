import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';

class ResultTipWidget extends StatelessWidget {
  const ResultTipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<AppBloc>().state.result} руб',
      style: Styles.appTextStyle,
    );
  }
}
