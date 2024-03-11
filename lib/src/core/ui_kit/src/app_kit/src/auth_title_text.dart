import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:flutter/material.dart';

@immutable
class AuthTitleText extends StatelessWidget {
  final String title;
  final String subtitle;

  /// Текст заголовка и описания экрана
  const AuthTitleText({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.theme.textTheme.headingMedium24.copyWith(
              color: context.theme.colors.text4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: context.theme.textTheme.bodyMedium14.copyWith(
              color: context.theme.colors.gray2,
            ),
          ),
        ],
      );
}
