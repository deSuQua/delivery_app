import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>(name: 'TrackTab')
class TrackPage extends StatelessWidget {
  /// Экран "Отслеживание"
  const TrackPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: _BodyLayout(),
      );
}

@immutable
class _BodyLayout extends StatelessWidget {
  /// Тело страницы
  const _BodyLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Placeholder();
}
