import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    // fontFamily: "IRANSans",
  );
  static final TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: calHeightScale(48) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    headline2: TextStyle(
        fontSize: calHeightScale(24) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    headline3: TextStyle(
        fontSize: calHeightScale(18) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    headline4: TextStyle(
        fontSize: calHeightScale(16) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    headline5: TextStyle(
        fontSize: calHeightScale(15) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    headline6: TextStyle(
        fontSize: calHeightScale(14) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    bodyText1: TextStyle(
        fontSize: calHeightScale(12) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
    bodyText2: TextStyle(
      fontSize: calHeightScale(10) * SizeConfig.mostafaScaleNumber,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
        fontSize: calHeightScale(9) * SizeConfig.mostafaScaleNumber,
        color: Colors.black),
  );
}
