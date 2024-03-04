import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/router/src/app_router.dart';
import 'package:delivery_app/src/core/ui_kit/src/app_kit/app_kit.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>(name: 'ProfileTab')
class ProfilePage extends StatelessWidget {
  /// Экран "Профиль"
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PrimaryAppBar(
          title: Text('Profile'),
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
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: () {
        context.router.push(const NotificationRoute());
      },
      child: Text('asd'));
}
