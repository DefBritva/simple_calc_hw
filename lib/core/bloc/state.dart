part of 'bloc.dart';

abstract class AppState extends Equatable {
  final ThemeData themeData;
  final String result;
  final int percent;
  final String userInput;
  const AppState(
    this.themeData,
    this.result,
    this.percent,
    this.userInput,
  );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [themeData, result, percent, userInput];
}

class InitialState extends AppState {
  const InitialState(super.themeData,
      [super.result = '0', super.percent = -1, super.userInput = '']);
}

class MainPageState extends AppState {
  const MainPageState(super.themeData,
      [super.result = '0', super.percent = -1, super.userInput = '']);
}
