import 'package:delivery_app/core/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppDI {
  static final router = Provider.autoDispose<AppRouter>((ref) {
    final router = AppRouter();
    ref.onDispose(router.dispose);
    return router;
  });
}
