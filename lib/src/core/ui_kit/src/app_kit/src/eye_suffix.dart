import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class EyeSuffix extends ConsumerWidget {
  final bool isShow;
  final VoidCallback onTap;

  /// Кнопка глаза
  const EyeSuffix({
    required this.isShow,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = switch (isShow) {
      true => Assets.icons.eyeSlash.svg(
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            context.getColorPair(
              context.theme.colors.text3,
              context.theme.colors.white,
              ref,
            ),
            BlendMode.srcIn,
          ),
        ),
      false => Assets.icons.eye.svg(
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            context.getColorPair(
              context.theme.colors.text3,
              context.theme.colors.white,
              ref,
            ),
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
