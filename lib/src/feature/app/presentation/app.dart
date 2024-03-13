import 'package:delivery_app/src/feature/app/di/app_di.dart';
import 'package:delivery_app/src/feature/app_theme/di/app_theme_di.dart';
import 'package:delivery_app/src/feature/app_theme/presentation/app_theme_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatelessWidget {
  final SharedPreferences localStorage;
  final Supabase supabase;
  const App({
    required this.localStorage,
    required this.supabase,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProviderScope(
        overrides: [
          AppDI.localStorage.overrideWithValue(localStorage),
          AppDI.supabase.overrideWithValue(supabase),
        ],
        // [=> AppTheme]
        child: const AppThemeScope(
          // [=> ToasterMessenger]
          child: MyApp(),
        ),
      );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Demo',
        theme: ref.watch(AppThemeDI.theme).data,
        routerConfig: ref.watch(AppDI.router).config(),
      );
}
