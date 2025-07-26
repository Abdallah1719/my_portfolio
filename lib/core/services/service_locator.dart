import 'package:get_it/get_it.dart';
import 'package:my_portfolio/core/storage/shared_preferences/cache_helper.dart';
import 'package:my_portfolio/l10n/cubit/local_cubit.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  //shared preferences
  sl.registerSingleton<CacheHelper>(CacheHelper());
  // locale cubit
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
}
