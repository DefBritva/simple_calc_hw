import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required TextEditingController inputController,
  }) : _inputController = inputController;

  final TextEditingController _inputController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ))),
        onPressed: () {
          final input = _inputController.text;
          context.read<AppBloc>().add(CalculateButtonPressed(input));
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const Text(
          'Рассчитать',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
