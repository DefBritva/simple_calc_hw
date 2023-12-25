import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required TextEditingController inputController,
    required this.scrollController,
  }) : _inputController = inputController;

  final TextEditingController _inputController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      final input = _inputController.text;
      context.read<AppBloc>().add(CalculateButtonPressed(input));
      FocusManager.instance.primaryFocus?.unfocus();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }, child: Builder(builder: (context) {
      context.watch<AppBloc>().state.locale;
      return Text(
        LocaleKeys.calculate.tr(),
        style: const TextStyle(fontSize: 16, color: Colors.white),
      );
    }));
  }
}
