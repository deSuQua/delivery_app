import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>(name: 'HomeTab')
class HomePage extends StatelessWidget {
  /// Экран "Главная"
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('asd'),
        ),
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
  Widget build(BuildContext context) => const Column(
        children: [
          Text('asd'),
        ],
      );
}
