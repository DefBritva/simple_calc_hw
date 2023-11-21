import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/features/percents_form/presentation/widgets/form_user_input.dart';

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
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormUserInput(
              hintText: 'enter small percent',
              controller: smallPercentController,
            ),
            const SizedBox(height: 50),
            FormUserInput(
              hintText: 'enter medium percent',
              controller: mediumPercentController,
            ),
            const SizedBox(height: 50),
            FormUserInput(
              hintText: 'enter large percent',
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
                    context.read<AppBloc>().add(SavePercents(
                          percents: [
                            smallPercent,
                            mediumPercent,
                            largePercent,
                          ],
                        ));
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text(
                    'save percents',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
