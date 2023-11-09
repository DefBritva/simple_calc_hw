import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/widgets/user_input.dart';

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
              bottom:
                  BorderSide(color: Theme.of(context).colorScheme.primary))),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.02, bottom: height * 0.01),
        child: Row(children: [
          UserInput(inputContoller: _inputController),
          Padding(
            padding: EdgeInsets.only(top: height * 0.025),
            child: IconButton(
                onPressed: () {
                  _inputController.clear();

                  context.read<AppBloc>().add(LoadInput(''));
                },
                icon: const Icon(
                  Icons.close_outlined,
                  size: 20,
                )),
          )
        ]),
      ),
    );
  }
}
