import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/features/percents_form/presentation/widgets/form_user_input.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

class PercentsFormBody extends StatefulWidget {
  const PercentsFormBody({
    super.key,
  });

  @override
  State<PercentsFormBody> createState() => _PercentsFormBodyState();
}

class _PercentsFormBodyState extends State<PercentsFormBody> {
  final smallPercentController = TextEditingController();
  final mediumPercentController = TextEditingController();
  final largePercentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  FormUserInput(
                    hintText: LocaleKeys.enter_small_percent.tr(),
                    controller: smallPercentController,
                  ),
                  const SizedBox(height: 50),
                  FormUserInput(
                    hintText: LocaleKeys.enter_medium_percent.tr(),
                    controller: mediumPercentController,
                  ),
                  const SizedBox(height: 50),
                  FormUserInput(
                    hintText: LocaleKeys.enter_large_percent.tr(),
                    controller: largePercentController,
                  ),
                  const SizedBox(height: 75),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          final smallPercent = smallPercentController.text;
                          final mediumPercent = mediumPercentController.text;
                          final largePercent = largePercentController.text;
                          final percents = <String>[];
                          percents.add(smallPercent);
                          percents.add(mediumPercent);
                          percents.add(largePercent);

                          if (int.tryParse(percents[0]) == null ||
                              int.tryParse(percents[1]) == null ||
                              int.tryParse(percents[2]) == null) {
                            final snackBar = SnackBar(
                              content:
                                  const Text(LocaleKeys.incorrectInput).tr(),
                              action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                  }),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            context
                                .read<AppBloc>()
                                .add(SavePercents(percents: percents));
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text(
                          LocaleKeys.savePercents,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ).tr()),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
