import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/generated/locale_keys.g.dart';

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
          width: MediaQuery.of(context).size.width * 1,
          child: Drawer(
            backgroundColor: Theme.of(context).canvasColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  trailing: const LanguageButton(),
                  title: Text(LocaleKeys.language.tr()),
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
                  title: Text(LocaleKeys.custom_percents.tr()),
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
                  title: Text(LocaleKeys.default_percents.tr()),
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
  _LanguageButtonState();
  String language = 'en';
  @override
  Widget build(BuildContext context) {
    language = context.watch<AppBloc>().state.locale;
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
            context.setLocale(Locale(language));
            context.read<AppBloc>().add(ChangeLanguage(language: language));
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
