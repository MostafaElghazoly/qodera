import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/helper/storage/local_storage.dart';
import 'common/helper/storage/shared_preferences.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

initDependencies() async {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  LocalStorageHelper localStorageHelper = LocalStorageHelper();
  Future.wait([sharedPreferencesHelper.init(), localStorageHelper.init(), EasyLocalization.ensureInitialized()]);
}
