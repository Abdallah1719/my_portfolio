import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/services/service_locator.dart';
import 'package:my_portfolio/features/home/presentation/screens/home_screen.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/l10n/cubit/local_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LocaleCubit>()..loadSavedLocale()),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: LocaleCubit.localizationsDelegates,
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(locale),
            title: 'Flutter Demo',
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
