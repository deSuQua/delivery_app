import 'package:delivery_app/src/core/app_theme/app_theme.dart';
import 'package:delivery_app/src/feature/app_theme/di/app_theme_di.dart';
import 'package:delivery_app/src/feature/app_theme/presentation/app_theme_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension BuildContextX on BuildContext {
  /// Provider container
  ProviderContainer get container => ProviderScope.containerOf(this);

  ProviderContainer get containerRead =>
      ProviderScope.containerOf(this, listen: false);

  /// Theme
  IAppTheme get theme => AppThemeScope.readOf(this);

  IAppTheme get themeRead => AppThemeScope.readOf(this, listen: false);

  /// MeaiqQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Color getColorPair(Color lightColor, Color darkColor, WidgetRef ref) {
    final brightness = ref.watch(AppThemeDI.theme).data.brightness;
    if (brightness == Brightness.light) {
      return lightColor;
    }

    return darkColor;
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
}
