import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

@immutable
class GoogleButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GoogleButton({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Column(
            children: [
              Text(
                text,
                style: context.theme.textTheme.bodyRegular14.copyWith(
                  color: context.theme.colors.gray2,
                ),
              ),
              const SizedBox(height: 8),
              Assets.icons.google.svg(
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  context.theme.colors.secondary,
                  BlendMode.srcIn,
                ),
              )
            ],
          ),
        ),
      );
}
