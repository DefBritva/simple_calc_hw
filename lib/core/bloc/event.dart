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
