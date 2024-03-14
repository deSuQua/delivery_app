import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/assets.gen.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/src/app_kit/app_kit.dart';
import 'package:delivery_app/src/feature/app_theme/bloc/app_theme.dart';
import 'package:delivery_app/src/feature/app_theme/di/app_theme_di.dart';
import 'package:delivery_app/src/feature/auth/bloc/auth.dart';
import 'package:delivery_app/src/feature/auth/di/auth_di.dart';
import 'package:delivery_app/src/feature/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 16,
        ),
        child: Column(
          children: [
            const UserCard(),
            const _DarkModeSwitch(),
            _ProfileTile(
              icon: Assets.icons.profile,
              title: 'Edit Profile',
              subtitle: 'Name, phone no, address, email ...',
            ),
            _ProfileTile(
              icon: Assets.icons.certificate,
              title: 'Statements & Reports',
              subtitle: 'Download transaction details, orders, deliveries',
            ),
            _ProfileTile(
              icon: Assets.icons.bell,
              title: 'Notification Settings',
              subtitle: 'mute, unmute, set location & tracking setting',
              onTap: () => context.router.push(const NotificationRoute()),
            ),
            _ProfileTile(
              icon: Assets.icons.card,
              title: 'Card & Bank account settings',
              subtitle: 'change cards, delete card details',
              onTap: () => context.router.push(const AddPaymentMethodRoute()),
            ),
            _ProfileTile(
              icon: Assets.icons.referrals,
              title: 'Referrals',
              subtitle: 'check no of friends and earn',
            ),
            _ProfileTile(
              icon: Assets.icons.map,
              title: 'About Us',
              subtitle: 'know more about us, terms and conditions',
            ),
            _ProfileTile(
              icon: Assets.icons.logout,
              title: 'Log Out',
              isLogout: true,
              onTap: () => _onLogout(context),
            ),
          ],
        ),
      );

  void _onLogout(BuildContext context) =>
      context.container.read(AuthDI.bloc).add(const AuthEvent.logout());
}

@immutable
class _DarkModeSwitch extends ConsumerStatefulWidget {
  /// Переключатель темной темы
  const _DarkModeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<_DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends ConsumerState<_DarkModeSwitch> {
  late final ValueNotifier<bool> _darkModeController;

  @override
  void initState() {
    super.initState();
    _darkModeController = ValueNotifier<bool>(false)..addListener(_toggle);
  }

  @override
  void dispose() {
    _darkModeController
      ..removeListener(_toggle)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Enable dark Mode',
                style: context.theme.textTheme.subtitleMedium16.copyWith(
                  color: context.getColorPair(
                    context.theme.colors.text4,
                    context.theme.colors.white,
                    ref,
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _darkModeController,
              builder: (context, child) => Switch(
                value: _darkModeController.value,
                onChanged: (v) => {
                  _darkModeController.value = !_darkModeController.value,
                },
              ),
            ),
          ],
        ),
      );

  void _toggle() => context.container.read(AppThemeDI.bloc).add(
        const AppThemeEvent.toggle(),
      );
}

@immutable
class _ProfileTile extends ConsumerWidget {
  final SvgGenImage icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool isLogout;

  /// Плитка
  const _ProfileTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isLogout = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 24,
          right: 24,
        ),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: context.getColorPair(
                context.theme.colors.white,
                context.theme.colors.primaryS2,
                ref,
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                    color: Colors.black.withOpacity(0.15))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  icon.svg(
                    colorFilter: isLogout
                        ? null
                        : ColorFilter.mode(
                            context.getColorPair(
                              context.theme.colors.text4,
                              context.theme.colors.white,
                              ref,
                            ),
                            BlendMode.srcIn,
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: context.theme.textTheme.subtitleMedium16
                                .copyWith(
                              color: context.getColorPair(
                                context.theme.colors.text4,
                                context.theme.colors.white,
                                ref,
                              ),
                            ),
                          ),
                          if (subtitle != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              subtitle ?? '',
                              style: context.theme.textTheme.bodyRegular14
                                  .copyWith(
                                color: context.theme.colors.gray2,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Assets.icons.chevronArrowRight.svg(
                    colorFilter: ColorFilter.mode(
                      context.getColorPair(
                        context.theme.colors.text3,
                        context.theme.colors.white,
                        ref,
                      ),
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
