import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class AuthRouterPage extends StatelessWidget {
  /// Авторизация
  const AuthRouterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoRouter(
        builder: (context, child) => child,
      );
}
