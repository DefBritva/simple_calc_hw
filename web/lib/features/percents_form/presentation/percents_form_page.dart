// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_calc_hw/features/percents_form/presentation/widgets/appbar.dart';
import 'package:simple_calc_hw/features/percents_form/presentation/widgets/body.dart';

class PercentsFormPage extends StatelessWidget {
  const PercentsFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PercentsFormAppBar(),
      body: PercentsFormBody(),
    );
  }
}
