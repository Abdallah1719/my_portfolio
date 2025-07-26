import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/services/service_locator.dart';
import 'package:my_portfolio/core/storage/shared_preferences/cache_helper.dart';
import 'package:my_portfolio/core/theme/theme.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool lightMode = true;
  Future<void> toggleTheme() async {
    lightMode ? lightMode = false : lightMode = true;
    await sl<CacheHelper>().saveData(key: 'lightMode', value: lightMode);
    emit(ThemeMode());
  }

  ThemeData currentTheme() {
    return lightMode ? AppTheme.lightMode : AppTheme.darkMode;
  }

  void loadSavedTheme() async {
    lightMode = await sl<CacheHelper>().getData(key: 'lightMode') ?? true;
    emit(LoadSavedState());
  }
}
