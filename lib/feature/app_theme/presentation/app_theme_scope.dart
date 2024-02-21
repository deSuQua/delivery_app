import 'package:delivery_app/core/app_theme/app_theme.dart';
import 'package:delivery_app/core/app_theme/src/app_text_theme/app_text_theme.dart';
import 'package:delivery_app/core/extenstion/extenstions.dart';
import 'package:delivery_app/feature/app_theme/di/app_theme_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeScope extends StatelessWidget {
  final Widget child;

  const AppThemeScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  static IAppTheme readOf(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context.container.read(AppThemeDI.theme);
    }
    return context.containerRead.read(AppThemeDI.theme);
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
        overrides: [
          AppThemeDI.theme.overrideWithValue(
            AppThemeLight(textTheme: AppTextTheme()),
          ),
        ],
        child: child,
      );
}
