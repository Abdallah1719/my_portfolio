import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/core/api/api_methods.dart';
import 'package:my_portfolio/core/api/dio_methods.dart';
import 'package:my_portfolio/core/storage/shared_preferences/cache_helper.dart';
import 'package:my_portfolio/core/theme/cubit/theme_cubit.dart';
import 'package:my_portfolio/features/home/data/data_source/portfolio_data_source.dart';
import 'package:my_portfolio/features/home/data/repository/portfolio_repository_impl.dart';
import 'package:my_portfolio/features/home/domain/repository/portfolio_repository.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/l10n/cubit/local_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  //shared preferences
  sl.registerSingleton<CacheHelper>(CacheHelper());

  // locale cubit
  sl.registerFactory<LocaleCubit>(() => LocaleCubit());

  // theme cubit
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());

  //dio
  sl.registerSingleton<Dio>(Dio());

  //api methods
  sl.registerSingleton<ApiMethods>(DioMethods(sl()));

  // data sources
  sl.registerLazySingleton<PortfolioRemoteDataSource>(
    () => PortfolioRemoteDataSourceImpl(sl()),
  );

  // repositories
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(sl<PortfolioRemoteDataSource>()),
  );

  // portfolio cubit
  sl.registerLazySingleton<PortfolioCubit>(
    () => PortfolioCubit(sl<PortfolioRepository>()),
  );
}
