import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_calc_hw/core/domain/calculator.dart';
import 'package:simple_calc_hw/core/theme/theme.dart';

part 'event.dart';
part 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ThemeChanger _themeChanger;
  final TipCalculator _calc;
  AppBloc(this._themeChanger, this._calc)
      : super(InitialState(_themeChanger.themeData)) {
    on<ThemeButtonPressed>((event, emit) {
      _themeChanger.toggleTheme();
      emit(MainPageState(_themeChanger.themeData, state.result, state.percent,
          state.userInput));
    });

    on<CalculateButtonPressed>((event, emit) {
      final String res = _calc.calculateTip(event.input, state.percent);
      if (int.tryParse(res) == null) {
        final newState = MainPageState(
          state.themeData,
          '0',
          state.percent,
          event.input,
        );
        emit(newState);
      } else if (int.parse(res) > 0) {
        final newState = MainPageState(
          state.themeData,
          res,
          state.percent,
          event.input,
        );
        emit(newState);
      } else {
        final newState = MainPageState(
          state.themeData,
          '0',
          state.percent,
          event.input,
        );
        emit(newState);
      }
    });

    on<PercentSelected>((event, emit) {
      final newState = MainPageState(
        state.themeData,
        state.result,
        event.percent,
        state.userInput,
      );
      emit(newState);
    });

    on<LoadInput>((event, emit) {
      final newState = MainPageState(
        state.themeData,
        state.result,
        state.percent,
        event.input,
      );
      emit(newState);
    });
  }
}
