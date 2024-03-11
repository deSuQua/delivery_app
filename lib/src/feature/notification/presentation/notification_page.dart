import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
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
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 120,
                bottom: 16,
              ),
              child: Assets.icons.bell.svg(
                width: 80,
                height: 80,
                colorFilter: ColorFilter.mode(
                  context.theme.colors.appBarTitle,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              'You have no notifications',
              style: context.theme.textTheme.subtitleMedium16.copyWith(
                color: context.theme.colors.appBarTitle,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
