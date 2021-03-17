import 'package:day03_ex/themes/theme_text.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get appTheme => ThemeData.light().copyWith(
        accentColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFFf0f2f5),
        textTheme: TextTheme(
          headline1:
              ThemeTexts.textTheme.headline1.copyWith(color: Colors.black),
          headline2:
              ThemeTexts.textTheme.headline2.copyWith(color: Colors.black),
          headline3:
              ThemeTexts.textTheme.headline2.copyWith(color: Colors.black),
          subtitle1:
              ThemeTexts.textTheme.subtitle1.copyWith(color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
          color: Colors.black,
        )),
        cardColor: Colors.white,
      );

  static get appThemeDark => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        accentColor: Colors.deepOrangeAccent,
        textTheme: TextTheme(
          headline1:
              ThemeTexts.textTheme.headline1.copyWith(color: Colors.white),
          headline2:
              ThemeTexts.textTheme.headline2.copyWith(color: Colors.white),
          headline3:
              ThemeTexts.textTheme.headline3.copyWith(color: Colors.white),
          subtitle1:
              ThemeTexts.textTheme.subtitle1.copyWith(color: Colors.white),
        ),
        cardColor: Color(0xFF242526),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
          color: Colors.white,
        )),
      );

  static ThemeData getTheme(isDarkMode) {
    return isDarkMode ? AppTheme.appThemeDark : AppTheme.appTheme;
  }
}
