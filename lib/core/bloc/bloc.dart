import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_calc_hw/core/domain/calculator.dart';
import 'package:simple_calc_hw/core/theme/theme.dart';

part 'event.dart';
part 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ThemeChanger _themeChanger;
  final TipCalculator _calc;
  AppBloc(this._themeChanger, this._calc)
      : super(InitialState(themeData: _themeChanger.themeData, locale: 'en')) {
    on<Start>((event, emit) async {
      final List<int> percents;
      final prefs = await SharedPreferences.getInstance();
      final locale = prefs.getString('locale');

      if (prefs.getInt('smallPercent') == null) {
        percents = state.percents;
      } else {
        percents = [
          prefs.getInt('smallPercent') ?? 0,
          prefs.getInt('mediumPercent') ?? 0,
          prefs.getInt('largePercent') ?? 0
        ];
      }
      final newState = MainPageState(
        locale: locale ?? 'ru',
        themeData: state.themeData,
        result: state.result,
        percent: state.percent,
        userInput: state.userInput,
        percents: percents,
      );
      emit(newState);
    });
    on<ThemeButtonPressed>((event, emit) {
      _themeChanger.toggleTheme();
      emit(
        MainPageState(
          locale: state.locale,
          result: state.result,
          percent: state.percent,
          userInput: state.userInput,
          themeData: _themeChanger.themeData,
          percents: state.percents,
        ),
      );
    });

    on<CalculateButtonPressed>((event, emit) {
      final String res = _calc.calculateTip(event.input, state.percent);
      if (int.tryParse(res) == null) {
        final newState = MainPageState(
          locale: state.locale,
          themeData: state.themeData,
          result: '0',
          percent: state.percent,
          userInput: event.input,
          percents: state.percents,
        );
        emit(newState);
      } else if (int.parse(res) > 0) {
        final newState = MainPageState(
          locale: state.locale,
          themeData: state.themeData,
          result: res,
          percent: state.percent,
          userInput: event.input,
          percents: state.percents,
        );
        emit(newState);
      } else {
        final newState = MainPageState(
          locale: state.locale,
          themeData: state.themeData,
          result: '0',
          percent: state.percent,
          userInput: event.input,
          percents: state.percents,
        );
        emit(newState);
      }
    });

    on<PercentSelected>((event, emit) {
      final newState = MainPageState(
        locale: state.locale,
        themeData: state.themeData,
        result: state.result,
        percent: event.percent,
        userInput: state.userInput,
        percents: state.percents,
      );
      emit(newState);
    });

    on<LoadInput>((event, emit) {
      final newState = MainPageState(
        locale: state.locale,
        themeData: state.themeData,
        result: state.result,
        percent: state.percent,
        userInput: event.input,
        percents: state.percents,
      );
      emit(newState);
    });

    on<ResetInputAndResult>((event, emit) {
      final newState = MainPageState(
        themeData: state.themeData,
        result: event.result,
        percent: state.percent,
        userInput: event.input,
        percents: state.percents,
        locale: state.locale,
      );
      emit(newState);
    });

    on<SavePercents>((event, emit) async {
      final List<int> percents = event.percents.map((e) {
        if (e.startsWith('0')) {
          return 0;
        } else {
          return (int.tryParse(e) ?? 0);
        }
      }).toList();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('smallPercent', percents[0]);
      await prefs.setInt('mediumPercent', percents[1]);
      await prefs.setInt('largePercent', percents[2]);
      final newState = MainPageState(
        locale: state.locale,
        themeData: state.themeData,
        result: state.result,
        percent: state.percent,
        userInput: state.userInput,
        percents: percents,
      );
      emit(newState);
    });

    on<SetDefaultPercents>((event, emit) async {
      final newState = MainPageState(
          locale: state.locale,
          themeData: state.themeData,
          result: state.result,
          percent: state.percent,
          userInput: state.userInput,
          percents: event.percents);
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('smallPercent');
      await prefs.remove('mediumPercent');
      await prefs.remove('largePercent');
      emit(newState);
    });

    on<ChangeLanguage>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', event.language);
      final newState = LocalLoadedState(
        themeData: state.themeData,
        result: state.result,
        percent: state.percent,
        userInput: state.userInput,
        percents: state.percents,
        locale: event.language,
      );
      emit(newState);
    });
  }
}
