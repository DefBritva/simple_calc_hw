import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

class UserInputWidget extends StatelessWidget {
  const UserInputWidget({
    super.key,
    required this.height,
    required this.width,
    required TextEditingController inputController,
  }) : _inputController = inputController;

  final double height;
  final double width;
  final TextEditingController _inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.07,
        width: width * 0.8,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).colorScheme.primary)),
        ),
        child: Row(
          children: [
            UserInput(inputContoller: _inputController),
            IconButton(
                onPressed: () {
                  _inputController.clear();

                  context.read<AppBloc>().add(ResetInputAndResult());
                },
                icon: const Icon(
                  Icons.close_outlined,
                  size: 25,
                ))
          ],
        ));
  }
}

class UserInput extends StatelessWidget {
  final TextEditingController inputContoller;

  const UserInput({
    super.key,
    required this.inputContoller,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        keyboardType: TextInputType.number,
        controller: inputContoller,
        onSubmitted: (value) {},
        onChanged: (value) {
          final input = inputContoller.text;
          context.read<AppBloc>().add(LoadInput(input));
        },
        style: const TextStyle(fontSize: 18),
        maxLength: 16,
        decoration: InputDecoration(
          hintText: LocaleKeys.amount.tr(),
          hintStyle: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 18),
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
