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
  /// Светлая/темная тема
  final Brightness brightness;

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
        iconButtonTheme: _iconButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        checkboxTheme: _checkboxTheme,
        switchTheme: _switchTheme,
        brightness: brightness,
        scaffoldBackgroundColor: colors.background,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        centerTitle: true,
        toolbarHeight: 64,
        titleSpacing: 12,
        titleTextStyle: textTheme.subtitleMedium16.copyWith(
          color: colors.appBarTitle,
        ),
        surfaceTintColor: colors.appBar,
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.5),
        scrolledUnderElevation: 3,
        backgroundColor: colors.appBar,
      );

  BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: colors.background,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textTheme.bodyRegular12,
        unselectedLabelStyle: textTheme.bodyRegular12,
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

  SwitchThemeData get _switchTheme => SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (states) => colors.white,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => Colors.transparent,
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return colors.gray1;
          },
        ),
        trackOutlineColor: MaterialStateProperty.resolveWith(
          (states) => Colors.transparent,
        ),
      );

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
    required this.brightness,
    required this.textTheme,
    required this.colors,
  });
}
