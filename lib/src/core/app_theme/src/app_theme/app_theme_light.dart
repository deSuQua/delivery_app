import 'package:delivery_app/src/core/app_theme/app_theme.dart';
import 'package:delivery_app/src/core/app_theme/src/app_text_theme/app_text_theme.dart';
import 'package:flutter/material.dart';

@immutable
class AppThemeLight extends AppThemeBase {
  const AppThemeLight({
    required final IAppTextTheme textTheme,
  }) : super(
          textTheme: textTheme,
          colors: const AppColorsLight(),
        );
}
