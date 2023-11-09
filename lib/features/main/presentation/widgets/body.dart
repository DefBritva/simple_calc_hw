import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';

class CalcBody extends StatefulWidget {
  const CalcBody({super.key});

  @override
  State<CalcBody> createState() => _CalcBodyState();
}

class _CalcBodyState extends State<CalcBody> {
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: height * 0.025),
          UserInputWidget(
              height: height, width: width, inputController: _inputController),
          AmountOfTipsTextWidget(height: height),
          const PercentsWidget(),
          SizedBox(height: height * 0.07),
          CalculateButton(inputController: _inputController),
          SizedBox(height: height * 0.125),
          const ResultTextWidget(),
          SizedBox(height: height * 0.01),
          const ResultTipWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}

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

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Итоговая сумма',
      style: Styles.appTextStyle,
    );
  }
}

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
      child: const Text(
        'Размер чаевых',
        style: Styles.appTextStyle,
      ),
    );
  }
}

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

// ignore: must_be_immutable
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

class PercentsWidget extends StatefulWidget {
  const PercentsWidget({
    super.key,
  });

  @override
  State<PercentsWidget> createState() => _PercentsWidgetState();
}

class _PercentsWidgetState extends State<PercentsWidget> {
  int? percent = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            title: const Text(
              '5%',
              style: Styles.appTextStyle,
            ),
            fillColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).primaryColor),
            value: 5,
            groupValue: percent,
            onChanged: (val) {
              setState(() {
                percent = val;
                context.read<AppBloc>().add(PercentSelected(percent ?? -1));
              });
            }),
        RadioListTile(
            title: const Text(
              '10%',
              style: Styles.appTextStyle,
            ),
            fillColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).primaryColor),
            value: 10,
            groupValue: percent,
            onChanged: (val) {
              setState(() {
                percent = val;
                context.read<AppBloc>().add(PercentSelected(percent ?? -1));
              });
            }),
        RadioListTile(
            title: const Text(
              '15%',
              style: Styles.appTextStyle,
            ),
            fillColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).primaryColor),
            value: 15,
            groupValue: percent,
            onChanged: (val) {
              setState(() {
                percent = val;
                context.read<AppBloc>().add(PercentSelected(percent ?? -1));
              });
            }),
      ],
    );
  }
}
