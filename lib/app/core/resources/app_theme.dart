import 'package:flutter/material.dart';
import 'resources.dart';

class AppThemeData {
  ThemeData get light => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors().primary,
        scaffoldBackgroundColor: AppColors().white,
        textTheme: TextTheme(
          displayLarge:
              AppTextTheme().headline1.copyWith(color: AppColors().black),
          bodyLarge: AppTextTheme().bodyText1.copyWith(color: AppColors().black),
          labelLarge: AppTextTheme().button.copyWith(color: Colors.white),
        ),
      );

  ThemeData get dark => ThemeData(
        // brightness: Brightness.dark,
        // primaryColor: AppColors.darkPrimary,
        // scaffoldBackgroundColor: AppColors.darkBackground,
        // textTheme: TextTheme(
        //   displayLarge:
        //       AppTextTheme().headline1.copyWith(color: AppColors.darkText),
        //   bodyLarge:
        //       AppTextTheme().bodyText1.copyWith(color: AppColors.darkText),
        //   labelLarge: AppTextTheme().button.copyWith(color: Colors.white),
        // ),
      );
  // static final ThemeData lightTheme = ThemeData(
  //   useMaterial3: true,
  //   // bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  //   scaffoldBackgroundColor: whiteColor,
  //   primaryColor: primaryColor,
  //   appBarTheme: const AppBarTheme(
  //     surfaceTintColor: Colors.transparent,
  //     // centerTitle: true,
  //     // titleTextStyle: GoogleFonts.urbanist().copyWith(
  //     //   color: textColor,
  //     //   fontSize: 24.sp,
  //     //   fontWeight: FontWeight.w600,
  //     //   letterSpacing: 0.48,
  //     // ),
  //   ),
  //   progressIndicatorTheme: const ProgressIndicatorThemeData(
  //     color: primaryColor,
  //   ),

  //   // inputDecorationTheme: InputDecorationTheme(
  //   //   contentPadding: const EdgeInsets.all(defaultPadding),
  //   //   suffixIconColor: hinttextColor,
  //   //   hintStyle: GoogleFonts.urbanist().copyWith(
  //   //     color: hinttextColor,
  //   //     fontSize: 14,
  //   //     fontWeight: FontWeight.w400,
  //   //     letterSpacing: 0.32,
  //   //   ),
  //   // ),
  //   // iconTheme: IconThemeData(color: Colors.black),
  //   // dividerColor: viewLineColor,
  //   // cardColor: cardLightColor,
  //   // colorScheme: const ColorScheme(
  //   //   primary: primaryColor,
  //   //   secondary: primaryColor,
  //   //   surface: Colors.white,
  //   //   background: Colors.white,
  //   //   error: Colors.red,
  //   //   onPrimary: Colors.white,
  //   //   onSecondary: Colors.black,
  //   //   onSurface: Colors.black,
  //   //   onBackground: Colors.black,
  //   //   onError: Colors.redAccent,
  //   //   brightness: Brightness.light,
  //   // ),
  //   checkboxTheme: CheckboxThemeData(
  //     shape: SmoothRectangleBorder(
  //       smoothness: 1,
  //       borderRadius: BorderRadius.circular(4),
  //       side: const BorderSide(
  //         width: 1.5,
  //         color: primaryColor,
  //       ),
  //     ),
  //     checkColor: WidgetStateProperty.all(Colors.white),
  //     // fillColor: WidgetStateProperty.all(primaryColor),
  //     materialTapTargetSize: MaterialTapTargetSize.padded,
  //   ),
  //   textTheme: GoogleFonts.urbanistTextTheme(),
  //   // pageTransitionsTheme: PageTransitionsTheme(
  //   //   builders: <TargetPlatform, PageTransitionsBuilder>{
  //   //     TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  //   //     TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  //   //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  //   //   },
  //   // )
  // );

  // static final ThemeData darkTheme = ThemeData();
}
