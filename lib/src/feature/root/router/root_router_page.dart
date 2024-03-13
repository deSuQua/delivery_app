import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:delivery_app/src/feature/auth/bloc/auth.dart';
import 'package:delivery_app/src/feature/auth/di/auth_di.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class RootRouterPage extends StatelessWidget {
  /// Обертка дочерней навигации
  const RootRouterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DIBlocListener<AuthBloc, AuthState>(
        bloc: AuthDI.bloc,
        listenWhen: (p, c) => c.user == null,
        listener: (BuildContext context, state) {
          if (state.user == null) {
            context.router.pushAndPopUntil(
              const AuthRouterRoute(),
              predicate: (_) => false,
            );
          }
        },
        child: AutoRouter(
          builder: (context, child) => child,
        ),
      );
}
