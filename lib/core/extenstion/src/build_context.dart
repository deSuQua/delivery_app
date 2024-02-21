import 'package:delivery_app/core/app_theme/app_theme.dart';
import 'package:delivery_app/feature/app_theme/presentation/app_theme_scope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension BuildContextX on BuildContext {
  /// Provider container
  ProviderContainer get container => ProviderScope.containerOf(this);

  ProviderContainer get containerRead =>
      ProviderScope.containerOf(this, listen: false);

  /// Theme
  IAppTheme get theme => AppThemeScope.readOf(this);

  IAppTheme get themeRead => AppThemeScope.readOf(this, listen: false);
}
