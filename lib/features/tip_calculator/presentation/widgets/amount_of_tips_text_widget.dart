import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Builder(builder: (context) {
        context.watch<AppBloc>().state.locale;
        return Text(
          LocaleKeys.tips.tr(),
          style: Styles.appTextStyle,
        );
      }),
    );
  }
}
