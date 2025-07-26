import 'package:flutter/material.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/core/services/service_locator.dart';
import 'package:my_portfolio/core/storage/shared_preferences/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await CacheHelper().init();
  runApp(const App());
}
