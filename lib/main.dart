import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/bloc/my_bloc_observer.dart';
import 'package:simple_calc_hw/core/domain/calculator.dart';
import 'package:simple_calc_hw/core/theme/theme.dart';
import 'package:simple_calc_hw/features/tip_calculator/tip_calculator_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const TipsCalculator());
}

class TipsCalculator extends StatelessWidget {
  const TipsCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ThemeChanger>(
          create: (context) => ThemeChanger(),
        ),
        RepositoryProvider<TipCalculator>(create: (context) => TipCalculator()),
      ],
      child: const AppBlocProvider(),
    );
  }
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(
        context.read<ThemeChanger>(),
        context.read<TipCalculator>(),
      ),
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<AppBloc>().state.themeData,
      debugShowCheckedModeBanner: false,
      home: const TipCalculatorPage(),
    );
  }
}
