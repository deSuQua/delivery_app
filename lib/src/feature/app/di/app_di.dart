import 'package:delivery_app/src/core/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppDI {
  static final localStorage = Provider.autoDispose<SharedPreferences>(
      (ref) => throw UnimplementedError());

  static final supabase =
      Provider.autoDispose<Supabase>((ref) => throw UnimplementedError());

  static final router = Provider.autoDispose<AppRouter>((ref) {
    final router = AppRouter();
    ref.onDispose(router.dispose);
    return router;
  });
}
