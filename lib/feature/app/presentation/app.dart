import 'package:delivery_app/feature/app/di/app_di.dart';
import 'package:delivery_app/feature/app_theme/di/app_theme_di.dart';
import 'package:delivery_app/feature/app_theme/presentation/app_theme_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const ProviderScope(
        // [=> AppTheme]
        child: AppThemeScope(
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
