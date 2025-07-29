import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/services/service_locator.dart';
import 'package:my_portfolio/core/theme/cubit/theme_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/splash/splash_screen.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/l10n/cubit/local_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LocaleCubit>()..loadSavedLocale()),
        BlocProvider(create: (context) => sl<ThemeCubit>()..loadSavedTheme()),
        BlocProvider(
          create: (context) => sl<PortfolioCubit>()..loadAllPortfolioData(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: LocaleCubit.localizationsDelegates,
                supportedLocales: S.delegate.supportedLocales,
                locale: Locale(locale),
                theme: context.watch<ThemeCubit>().currentTheme(),
                title: 'My Portfolio',
                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
