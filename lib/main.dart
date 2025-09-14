import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

import 'app/core/core.dart';
import 'app/routes/app_pages.dart';
import 'binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppConfig.initThemeMode();

  runApp(
    ScreenUtilInit(
      // Initialize ScreenUtil
      designSize: Size(
        375,
        812,
      ), // Set your design size here (standard iPhone 7 design size)
      builder: (context, child) => GetMaterialApp(
        title: AppConfig.appName,
        initialBinding: AppBinding(), // 🔥 inject singleton(s)
        // Localization
        translations: MyAppTranslation(),
        locale: AppConfig.defaultLocale,
        fallbackLocale: AppConfig.defaultLocale,
        supportedLocales: MyAppTranslation.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        debugShowCheckedModeBanner: AppConfig.isDebugMode,
        // Theme
        themeMode: AppConfig.appDefaultTheme,
        theme: R.theme.light,
        darkTheme: R.theme.dark,
        // End
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
