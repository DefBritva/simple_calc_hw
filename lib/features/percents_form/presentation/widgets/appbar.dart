import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

class PercentsFormAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PercentsFormAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.custom_percents.tr(),
        style: const TextStyle(fontSize: 18),
      ),
      centerTitle: true,
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
