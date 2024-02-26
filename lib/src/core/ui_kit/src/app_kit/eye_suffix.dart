import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

@immutable
class EyeSuffix extends StatelessWidget {
  final bool isShow;
  final VoidCallback onTap;

  /// Кнопка глаза
  const EyeSuffix({
    required this.isShow,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = switch (isShow) {
      true => Assets.icons.eyeSlash.svg(
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            context.theme.colors.text3,
            BlendMode.srcIn,
          ),
        ),
      false => Assets.icons.eye.svg(
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            context.theme.colors.text3,
            BlendMode.srcIn,
          ),
        ),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: onTap,
        icon: icon,
      ),
    );
  }
}
