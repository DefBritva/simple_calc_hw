import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';

class CalcDrawer extends StatelessWidget {
  const CalcDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:
            EdgeInsets.only(top: Scaffold.of(context).appBarMaxHeight ?? 0),
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Drawer(
            backgroundColor: Theme.of(context).canvasColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ListTile(
                  trailing: LanguageButton(),
                  title: Text('language'),
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                        Navigator.of(context).pushNamed('/calculator/form');
                      },
                      icon: Icon(
                        Icons.percent_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  title: const Text('custom percents'),
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        context.read<AppBloc>().add(SetDefaultPercents());
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: Icon(
                        Icons.autorenew_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  title: const Text('default percents'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatefulWidget {
  const LanguageButton({
    super.key,
  });

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  String language = 'en';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: language,
        underline: Container(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onChanged: (String? newValue) {
          setState(() {
            language = newValue!;
          });
        },
        items: [
          DropdownMenuItem<String>(
            value: 'en',
            child: Text(
              'en',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          DropdownMenuItem<String>(
            value: 'ru',
            child: Text('ru',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary)),
          )
        ]);
  }
}

class LanguageItems extends StatelessWidget {
  const LanguageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('russian'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('english'),
        ),
      ],
    );
  }
}
