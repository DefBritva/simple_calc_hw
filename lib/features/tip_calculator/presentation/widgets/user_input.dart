import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';

class UserInput extends StatelessWidget {
  final TextEditingController inputContoller;

  UserInput({
    super.key,
    required this.inputContoller,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: inputContoller,
        onSubmitted: (value) {},
        onChanged: (value) {
          final input = inputContoller.text;
          context.read<AppBloc>().add(LoadInput(input));
        },
        style: const TextStyle(),
        maxLength: 33,
        decoration: InputDecoration(
          hintText: 'Сумма счёта (руб)',
          contentPadding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          hintStyle: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 18),
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
