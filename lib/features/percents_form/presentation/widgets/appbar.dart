import 'package:flutter/material.dart';

class PercentsFormAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PercentsFormAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('custom percents'),
      centerTitle: true,
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
