import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class NotificationPage extends StatelessWidget {
  /// Экран "Уведомления"
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PrimaryAppBar(
          title: Text('Notification'),
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
  Widget build(BuildContext context) => Column(
        children: [
          Text('asd'),
          ElevatedButton(
              onPressed: () {
                context.router.push(const NotificationRoute());
              },
              child: const Text('asd'))
        ],
      );
}
