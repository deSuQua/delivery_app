import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class RootRouterPage extends StatelessWidget {
  /// Обертка дочерней навигации
  const RootRouterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoRouter(
        builder: (context, child) => child,
      );
}
