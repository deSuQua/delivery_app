import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
@RoutePage<void>()
class RootTabPage extends ConsumerWidget {
  /// Корневой экран
  const RootTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => AutoTabsScaffold(
        resizeToAvoidBottomInset: false,
        navigatorObservers: () => [AutoRouteObserver()],
        routes: const [
          HomeTab(),
          WalletTab(),
          TrackTab(),
          ProfileTab(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) => SizedBox(
          height: 60 + context.mediaQuery.padding.bottom,
          child: Theme(
            data: context.theme.data.copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: context.theme.colors.background,
                selectedItemColor: context.theme.colors.primary,
                unselectedItemColor: context.getColorPair(
                  context.theme.colors.gray2,
                  context.theme.colors.white,
                  ref,
                ),
                onTap: context.tabsRouter.setActiveIndex,
                currentIndex: context.watchTabsRouter.activeIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: _NavigationIcon(
                      activeIndex: 0,
                      icon: Assets.icons.home,
                      selectedIcon: Assets.icons.homeSelected,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: _NavigationIcon(
                      activeIndex: 1,
                      icon: Assets.icons.wallet,
                      selectedIcon: Assets.icons.walletSelected,
                    ),
                    label: 'Wallet',
                  ),
                  BottomNavigationBarItem(
                    icon: _NavigationIcon(
                      activeIndex: 2,
                      icon: Assets.icons.track,
                      selectedIcon: Assets.icons.trackSelected,
                    ),
                    label: 'Track',
                  ),
                  BottomNavigationBarItem(
                    icon: _NavigationIcon(
                      activeIndex: 3,
                      icon: Assets.icons.profile,
                      selectedIcon: Assets.icons.profileSelected,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

@immutable
class _NavigationIcon extends StatelessWidget {
  final SvgGenImage icon;
  final SvgGenImage selectedIcon;
  final int activeIndex;

  const _NavigationIcon({
    required this.activeIndex,
    required this.icon,
    required this.selectedIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = _isActive(context);

    final unselectedColor = context.theme.data.brightness == Brightness.light
        ? context.theme.colors.gray2
        : context.theme.colors.white;
    final navigationIcon = isActive ? selectedIcon : icon;
    final colorFilter = isActive
        ? null
        : ColorFilter.mode(
            unselectedColor,
            BlendMode.srcIn,
          );

    return _ActiveIndicator(
      icon: _IconPadding(
        child: navigationIcon.svg(
          width: 24,
          height: 24,
          colorFilter: colorFilter,
        ),
      ),
      isActive: isActive,
    );
  }

  bool _isActive(BuildContext context) =>
      context.watchTabsRouter.activeIndex == activeIndex;
}

@immutable
class _IconPadding extends StatelessWidget {
  final Widget child;

  const _IconPadding({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: child,
      );
}

@immutable
class _ActiveIndicator extends StatelessWidget {
  final Widget icon;
  final bool isActive;

  /// Индикатор иконки
  const _ActiveIndicator({
    required this.icon,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isActive) {
      return Padding(
        padding: const EdgeInsets.only(top: 9),
        child: icon,
      );
    }
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: context.theme.colors.primary.withOpacity(.5),
                offset: const Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: ColoredBox(
            color: context.theme.colors.primary,
            child: const SizedBox(
              width: 32,
              height: 2,
            ),
          ),
        ),
        const SizedBox(height: 7),
        icon,
      ],
    );
  }
}
