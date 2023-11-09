import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';

class CalcAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalcAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Simple tips calc'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => context.read<AppBloc>().add(ThemeButtonPressed()),
          icon: Theme.of(context).primaryColor == Colors.deepPurpleAccent
              ? const Icon(Icons.light_mode_sharp)
              : const Icon(Icons.dark_mode_sharp),
        )
      ],
    );
  }

  static final _appBar = AppBar().preferredSize;
  @override
  Size get preferredSize => _appBar;
}
