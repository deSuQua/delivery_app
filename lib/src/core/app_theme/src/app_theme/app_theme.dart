import 'package:delivery_app/src/core/app_theme/app_theme.dart';
import 'package:delivery_app/src/core/app_theme/src/app_text_theme/app_text_theme.dart';
import 'package:flutter/material.dart';

abstract class IAppTheme {
  /// Material Theme Data
  ThemeData get data;

  /// Цвета
  IAppColors get colors;

  ///
  /// См. также [IAppTextTheme]
  IAppTextTheme get textTheme;
}

abstract class AppThemeBase implements IAppTheme {
  /// Статические цвета
  @override
  final IAppColors colors;

  /// Текстовая тема
  @override
  final IAppTextTheme textTheme;

  /// Material Theme Data
  @override
  ThemeData get data => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: colors.text4),
        appBarTheme: _appBarTheme,
        iconButtonTheme: _iconButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        checkboxTheme: _checkboxTheme,
        scaffoldBackgroundColor: colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        centerTitle: true,
        toolbarHeight: 56,
        titleSpacing: 12,
        elevation: 10,
        scrolledUnderElevation: 0,
        backgroundColor: colors.white,
      );

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          maximumSize: const Size.fromHeight(46),
          minimumSize: const Size.fromHeight(46),
          textStyle: textTheme.subtitleBold16.copyWith(color: colors.white),
          backgroundColor: colors.primary,
          foregroundColor: colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
      );

  IconButtonThemeData get _iconButtonTheme => IconButtonThemeData(
          style: IconButton.styleFrom(
        minimumSize: const Size.square(40),
        maximumSize: const Size.square(40),
        foregroundColor: colors.text4,
      ));

  CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
      checkColor: MaterialStateProperty.resolveWith(
        (states) => colors.white,
      ),
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) return colors.primary;
          return null;
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(
        color: colors.primary,
      ));

  /// App theme base
  const AppThemeBase({
    required this.textTheme,
    required this.colors,
  });
}
