import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

@immutable
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? action;

  /// App bar
  const PrimaryAppBar({
    required this.title,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionWidget = action;
    List<Widget>? actions;
    if (actionWidget != null) {
      actions = [actionWidget];
    }
    final scope = RouterScope.of(context, watch: true).controller;

    Widget leading = const SizedBox.shrink();
    if (scope.canPop(ignoreChildRoutes: true)) {
      leading = const _LeadingIcon();
    }

    return AppBar(
      leading: leading,
      leadingWidth: 48,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

@immutable
class _LeadingIcon extends StatelessWidget {
  /// Иконка спереди
  const _LeadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 8,
          top: 12,
          bottom: 12,
        ),
        child: IconButton(
          onPressed: () => context.router.pop(),
          icon: Assets.icons.arrowLeftOutlined.svg(
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              context.theme.colors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
}
