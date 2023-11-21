part of 'bloc.dart';

sealed class AppEvent extends Equatable {}

final class ThemeButtonPressed extends AppEvent {
  @override
  List<Object?> get props => [];
}

final class CalculateButtonPressed extends AppEvent {
  final String input;
  CalculateButtonPressed(this.input);

  @override
  List<Object?> get props => [input];
}

final class PercentSelected extends AppEvent {
  final int percent;

  PercentSelected(this.percent);

  @override
  List<Object?> get props => [percent];
}

final class LoadInput extends AppEvent {
  final String input;

  LoadInput(this.input);

  @override
  List<Object?> get props => [input];
}

final class ResetInputAndResult extends AppEvent {
  final String input = '';
  final String result = '0';

  @override
  List<Object?> get props => [input, result];
}

final class SavePercents extends AppEvent {
  final List<String> percents;

  SavePercents({required this.percents});

  @override
  List<Object?> get props => [percents];
}

final class Start extends AppEvent {
  @override
  List<Object?> get props => [];
}

final class SetDefaultPercents extends AppEvent {
  final List<int> percents = const [5, 10, 15];

  @override
  List<Object?> get props => [percents];
}
