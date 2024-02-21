import 'package:delivery_app/core/app_theme/app_theme.dart';
import 'package:delivery_app/core/app_theme/src/app_text_theme/app_text_theme.dart';
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
        appBarTheme: _appBarTheme,
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

  /// App theme base
  const AppThemeBase({
    required this.textTheme,
    required this.colors,
  });
}
