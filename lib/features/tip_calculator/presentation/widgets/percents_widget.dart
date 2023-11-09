import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/styles/my_text_style.dart';

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
