import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  const AppTheme._();

  // Light Theme Colors
  static const Color lightBackgroundColor = Color(0xfff2f2f2);
  static const Color lightPrimaryColor = Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static const Color lightParticlesColor = Color(0x44948282);

  // Dark Theme Colors
  static const Color darkBackgroundColor = Color(0xff1a2127);
  static const Color darkPrimaryColor = Color(0xff1a2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static const Color darkParticlesColor = Color(0x441c2a3d);

  static final lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    backgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: lightPrimaryColor,
      onSurface: darkPrimaryColor,
      secondary: lightAccentColor,
      brightness: Brightness.light,
    ),
  );

  static final darkTheme = ThemeData(
    backgroundColor: darkBackgroundColor,
    primaryColor: darkPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: darkPrimaryColor,
      onSurface: lightPrimaryColor,
      secondary: darkAccentColor,
      brightness: Brightness.dark,
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static void setStatusBatAndNavigationBarColors(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness));
  }
}
