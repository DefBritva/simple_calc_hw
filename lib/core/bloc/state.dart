part of 'bloc.dart';

abstract class AppState extends Equatable {
  final ThemeData themeData;
  final String result;
  final int percent;
  final List<int> percents;
  final String userInput;
  final String locale;
  const AppState({
    required this.percents,
    required this.themeData,
    required this.result,
    required this.percent,
    required this.userInput,
    required this.locale,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [themeData, result, percent, userInput, percents, locale];
}

class InitialState extends AppState {
  const InitialState({
    required super.themeData,
    super.result = '0',
    super.percent = -1,
    super.userInput = '',
    super.percents = const [5, 10, 15],
    required super.locale,
  });
}

class MainPageState extends AppState {
  const MainPageState({
    required super.themeData,
    required super.result,
    required super.percent,
    required super.userInput,
    required super.percents,
    required super.locale,
  });
}

class LocalLoadedState extends AppState {
  const LocalLoadedState(
      {required super.percents,
      required super.themeData,
      required super.result,
      required super.percent,
      required super.userInput,
      required super.locale});
}
