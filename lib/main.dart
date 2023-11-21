import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calc_hw/core/bloc/bloc.dart';
import 'package:simple_calc_hw/core/bloc/my_bloc_observer.dart';
import 'package:simple_calc_hw/core/domain/calculator.dart';
import 'package:simple_calc_hw/core/theme/theme.dart';
import 'package:simple_calc_hw/features/percents_form/presentation/percents_form_page.dart';
import 'package:simple_calc_hw/features/tip_calculator/presentation/tip_calculator_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:simple_calc_hw/generated/codegen_loader.g.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
      )..add(Start()),
      child: EasyLocalization(
          assetLoader: const CodegenLoader(),
          supportedLocales: const [Locale('en'), Locale('ru')],
          path: 'lib/core/localization/translations',
          fallbackLocale: const Locale('en'),
          child: const App()),
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.watch<AppBloc>().state.themeData,
      debugShowCheckedModeBanner: false,
      routes: {
        '/calculator': (context) => const TipCalculatorPage(),
        '/calculator/form': (context) => const PercentsFormPage(),
      },
      initialRoute: '/calculator',
    );
  }
}
