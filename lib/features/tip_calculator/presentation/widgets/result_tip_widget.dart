import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

class ResultTipWidget extends StatelessWidget {
  const ResultTipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<AppBloc>().state.result} ${LocaleKeys.currency.tr()}',
      style: Styles.appTextStyle,
    );
  }
}
