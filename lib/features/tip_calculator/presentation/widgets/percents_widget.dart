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
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile(
                title: Text(
                  '${state.percents[0]}',
                  style: Styles.appTextStyle,
                ),
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).primaryColor),
                value: state.percents[0],
                groupValue: percent,
                onChanged: (val) {
                  setState(() {
                    percent = val;
                    context.read<AppBloc>().add(PercentSelected(percent ?? -1));
                  });
                }),
            RadioListTile(
                title: Text(
                  '${state.percents[1]}',
                  style: Styles.appTextStyle,
                ),
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).primaryColor),
                value: state.percents[1],
                groupValue: percent,
                onChanged: (val) {
                  setState(() {
                    percent = val;
                    context.read<AppBloc>().add(PercentSelected(percent ?? -1));
                  });
                }),
            RadioListTile(
                title: Text(
                  '${state.percents[2]}',
                  style: Styles.appTextStyle,
                ),
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).primaryColor),
                value: state.percents[2],
                groupValue: percent,
                onChanged: (val) {
                  setState(() {
                    percent = val;
                    context.read<AppBloc>().add(PercentSelected(percent ?? -1));
                  });
                }),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      percent = 0;
                      context
                          .read<AppBloc>()
                          .add(PercentSelected(percent ?? -1));
                    });
                  },
                  child: const Text('сброс')),
            )
          ],
        );
      },
    );
  }
}
