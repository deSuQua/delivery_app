import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class RootTabPage extends StatelessWidget {
  /// Корневой экран
  const RootTabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
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
            child: BottomNavigationBar(
              backgroundColor: context.theme.colors.white,
              onTap: context.tabsRouter.setActiveIndex,
              currentIndex: context.watchTabsRouter.activeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: _HomeIcon(),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _WalletIcon(),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: _TrackIcon(),
                  label: 'Track',
                ),
                BottomNavigationBarItem(
                  icon: _ProfileIcon(),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
}

@immutable
class _HomeIcon extends StatelessWidget {
  const _HomeIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon =
        _isActive(context) ? Assets.icons.homeSelected : Assets.icons.home;
    final colorFilter = _isActive(context)
        ? null
        : ColorFilter.mode(
            context.theme.colors.gray2,
            BlendMode.srcIn,
          );

    return _IconPadding(
      child: icon.svg(
        width: 24,
        height: 24,
        colorFilter: colorFilter,
      ),
    );
  }

  bool _isActive(BuildContext context) =>
      context.watchTabsRouter.activeIndex == 0;
}

@immutable
class _WalletIcon extends StatelessWidget {
  const _WalletIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon =
        _isActive(context) ? Assets.icons.walletSelected : Assets.icons.wallet;
    final colorFilter = _isActive(context)
        ? null
        : ColorFilter.mode(
            context.theme.colors.gray2,
            BlendMode.srcIn,
          );

    return _IconPadding(
      child: icon.svg(
        width: 24,
        height: 24,
        colorFilter: colorFilter,
      ),
    );
  }

  bool _isActive(BuildContext context) =>
      context.watchTabsRouter.activeIndex == 1;
}

@immutable
class _TrackIcon extends StatelessWidget {
  const _TrackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon =
        _isActive(context) ? Assets.icons.trackSelected : Assets.icons.track;
    final colorFilter = _isActive(context)
        ? null
        : ColorFilter.mode(
            context.theme.colors.gray2,
            BlendMode.srcIn,
          );

    return _IconPadding(
      child: icon.svg(
        width: 24,
        height: 24,
        colorFilter: colorFilter,
      ),
    );
  }

  bool _isActive(BuildContext context) =>
      context.watchTabsRouter.activeIndex == 2;
}

@immutable
class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = _isActive(context)
        ? Assets.icons.profileSelected
        : Assets.icons.profile;
    final colorFilter = _isActive(context)
        ? null
        : ColorFilter.mode(
            context.theme.colors.gray2,
            BlendMode.srcIn,
          );

    return _IconPadding(
      child: icon.svg(
        width: 24,
        height: 24,
        colorFilter: colorFilter,
      ),
    );
  }

  bool _isActive(BuildContext context) =>
      context.watchTabsRouter.activeIndex == 3;
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