import 'package:delivery_app/src/core/app_theme/app_theme.dart';
import 'package:delivery_app/src/core/app_theme/src/app_text_theme/app_text_theme.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:delivery_app/src/feature/app_theme/bloc/app_theme.dart';
import 'package:delivery_app/src/feature/app_theme/di/app_theme_di.dart';
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
  Widget build(BuildContext context) =>
      DIBlocBuilder<AppThemeBloc, AppThemeState>(
        bloc: AppThemeDI.bloc,
        builder: (context, state) => ProviderScope(
          overrides: [
            AppThemeDI.theme.overrideWithValue(
              state.map(
                light: (_) => AppThemeLight(
                  textTheme: AppTextTheme(),
                  colors: const AppColorsLight(),
                  brightness: Brightness.light,
                ),
                dark: (_) => AppThemeDark(
                  textTheme: AppTextTheme(),
                  colors: const AppColorsDark(),
                  brightness: Brightness.dark,
                ),
              ),
            ),
          ],
          child: child,
        ),
      );
}

@immutable
mixin _AppThemeLight {}

@immutable
class AppThemeLight = AppThemeBase with _AppThemeLight;

@immutable
mixin _AppThemeDark {}

@immutable
class AppThemeDark = AppThemeBase with _AppThemeDark;
