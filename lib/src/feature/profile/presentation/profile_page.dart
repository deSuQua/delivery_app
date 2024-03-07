import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/assets.gen.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/src/app_kit/app_kit.dart';
import 'package:delivery_app/src/feature/app_theme/bloc/app_theme.dart';
import 'package:delivery_app/src/feature/app_theme/di/app_theme_di.dart';
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
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 16,
        ),
        child: Column(
          children: [
            const _UserCard(),
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
            ),
          ],
        ),
      );
}

@immutable
class _UserCard extends StatefulWidget {
  /// Карточка пользователя
  const _UserCard({
    Key? key,
  }) : super(key: key);

  @override
  State<_UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<_UserCard> {
  late final ValueNotifier<bool> _hideBalanceController;

  @override
  void initState() {
    super.initState();
    _hideBalanceController = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _hideBalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox.square(
                dimension: 60,
                child: Image.network(
                  'https://www.unitedagents.co.uk/sites/default/files/thumbnails/image/guybolton-photo-deadline.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _UserNameAndBalance(
              hideBalanceController: _hideBalanceController,
            ),
            AnimatedBuilder(
              animation: _hideBalanceController,
              builder: (context, child) => EyeSuffix(
                isShow: _hideBalanceController.value,
                onTap: () => _hideBalanceController.value =
                    !_hideBalanceController.value,
              ),
            ),
          ],
        ),
      );
}

@immutable
class _UserNameAndBalance extends StatelessWidget {
  final ValueNotifier<bool> hideBalanceController;

  /// Имя и баланс
  const _UserNameAndBalance({
    required this.hideBalanceController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Ken',
                style: context.theme.textTheme.subtitleMedium16.copyWith(
                  color: context.theme.colors.text4,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedBuilder(
                animation: hideBalanceController,
                builder: (context, child) => RichText(
                  text: TextSpan(
                    text: 'Current balance: ',
                    style: context.theme.textTheme.bodyRegular12.copyWith(
                      color: context.theme.colors.text4,
                    ),
                    children: [
                      TextSpan(
                        text: hideBalanceController.value
                            ? 'N********'
                            : 'N10,712:00',
                        style: context.theme.textTheme.bodyRegular12.copyWith(
                          color: context.theme.colors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

@immutable
class _DarkModeSwitch extends StatefulWidget {
  /// Переключатель темной темы
  const _DarkModeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<_DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<_DarkModeSwitch> {
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
                  color: context.theme.colors.text4,
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
class _ProfileTile extends StatelessWidget {
  final SvgGenImage icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  /// Плитка
  const _ProfileTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 24,
          right: 24,
        ),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: context.theme.colors.white,
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
                  icon.svg(),
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
                              color: context.theme.colors.text4,
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
                      context.theme.colors.text3,
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
