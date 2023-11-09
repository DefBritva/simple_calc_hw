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
  String input = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.025),
            child: const Text(
              'Сумма счёта (руб)',
              style: Styles.appTextStyle,
            ),
          ),
          Container(
            height: height * 0.07,
            width: width * 0.8,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary)),
            child: Padding(
              padding:
                  EdgeInsets.only(left: width * 0.02, bottom: height * 0.01),
              child: Row(children: [
                UserInput(inputContoller: _inputController),
                IconButton(
                    onPressed: () {
                      _inputController.clear();
                      input = _inputController.text;
                      context.read<AppBloc>().add(LoadInput(input));
                    },
                    icon: const Icon(
                      Icons.close_outlined,
                      size: 40,
                    ))
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: const Text(
              'Размер чаевых',
              style: Styles.appTextStyle,
            ),
          ),
          const RadiosWidget(),
          ElevatedButton(
              onPressed: () {
                input = _inputController.text;
                context.read<AppBloc>().add(CalculateButtonPressed(input));
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text(
                'Рассчитать',
                style: TextStyle(fontSize: 17, color: Colors.white),
              )),
          SizedBox(
            height: height * 0.125,
          ),
          const Text(
            'Итоговая сумма',
            style: Styles.appTextStyle,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            '${context.watch<AppBloc>().state.result} руб',
            style: Styles.appTextStyle,
          ),
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

// ignore: must_be_immutable
class UserInput extends StatelessWidget {
  final TextEditingController inputContoller;
  String input = '';

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
          input = inputContoller.text;
          context.read<AppBloc>().add(LoadInput(input));
        },
        style: Styles.appTextStyle,
        maxLength: 19,
        decoration:
            const InputDecoration(counterText: '', border: InputBorder.none),
      ),
    );
  }
}

class RadiosWidget extends StatefulWidget {
  const RadiosWidget({
    super.key,
  });

  @override
  State<RadiosWidget> createState() => _RadiosWidgetState();
}

class _RadiosWidgetState extends State<RadiosWidget> {
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
