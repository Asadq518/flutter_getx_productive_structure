import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/core.dart';
import 'app/routes/app_pages.dart';
import 'binding/app_binding.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    GetMaterialApp(
      title: AppConfig.appName,
      initialBinding: AppBinding(), // 🔥 inject singleton(s)
      //Localization
      translations: MyAppTranslation(),
      locale: AppConfig.defaultLocale,
      fallbackLocale: AppConfig.defaultLocale,
      supportedLocales: MyAppTranslation.supportedLocales,
      //theme
      themeMode: AppConfig.appDefaultTheme,
      theme: R.theme.light,
      darkTheme: R.theme.dark,
      //end
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
