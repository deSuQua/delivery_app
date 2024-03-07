import 'package:delivery_app/src/core/app_theme/app_theme.dart';
import 'package:delivery_app/src/feature/app_theme/bloc/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppThemeDI {
  static final theme = Provider.autoDispose<IAppTheme>(
    (ref) => throw UnimplementedError(),
  );

  static final bloc = Provider.autoDispose<AppThemeBloc>((ref) {
    final bloc = AppThemeBloc();
    ref.onDispose(bloc.close);
    return bloc;
  });
}
