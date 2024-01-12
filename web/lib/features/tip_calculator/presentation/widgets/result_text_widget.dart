import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      context.watch<AppBloc>().state.locale;
      return Text(
        LocaleKeys.total_tip.tr(),
        style: Styles.appTextStyle,
      );
    });
  }
}
