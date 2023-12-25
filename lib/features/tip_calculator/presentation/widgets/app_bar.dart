import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

class CalcAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalcAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.settings)),
      title: Text(LocaleKeys.title.tr(),
          style: const TextStyle(color: Colors.white, fontSize: 18)),
      centerTitle: true,
      actions: [
        IconButton(
          color: Colors.white,
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
