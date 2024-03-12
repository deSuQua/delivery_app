import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:delivery_app/src/feature/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
@RoutePage<void>(name: 'HomeTab')
class HomePage extends StatelessWidget {
  /// Экран "Главная"
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
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
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: context.mediaQuery.padding.top),
        child: const Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 24,
              bottom: 16,
            ),
            child: Column(
              children: [
                _SearchBar(),
                _UserCard(),
                Specials(),
                _ActiveCards(),
              ],
            ),
          ),
        ),
      );
}

@immutable
class _SearchBar extends ConsumerWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Ink(
          decoration: BoxDecoration(
            color: context.getColorPair(
              context.theme.colors.gray1,
              context.theme.colors.primaryS3,
              ref,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Search services',
                    style: context.theme.textTheme.bodyRegular12.copyWith(
                      color: context.theme.colors.gray2,
                    ),
                  ),
                ),
                Assets.icons.search.svg(
                  width: 12,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    context.theme.colors.gray2,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

@immutable
class _UserCard extends ConsumerWidget {
  /// Карточка пользователя
  const _UserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            child: Ink(
              decoration: BoxDecoration(
                color: context.getColorPair(
                  context.theme.colors.primary,
                  context.theme.colors.primaryS2,
                  ref,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -39,
                    top: -62,
                    child: CircleAvatar(
                      radius: 61,
                      backgroundColor: context.getColorPair(
                        context.theme.colors.primaryS7,
                        context.theme.colors.primaryS3,
                        ref,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -37,
                    bottom: -77,
                    child: CircleAvatar(
                      radius: 61,
                      backgroundColor: context.getColorPair(
                        context.theme.colors.primaryS7,
                        context.theme.colors.primaryS3,
                        ref,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    child: Row(
                      children: [
                        const Avatar(),
                        const _UserNameAndSubtitle(),
                        IconButton(
                          onPressed: () => _onBell(context),
                          style: IconButton.styleFrom(
                            foregroundColor: context.theme.colors.white,
                          ),
                          icon: Assets.icons.bell.svg(
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              context.theme.colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<void> _onBell(BuildContext context) =>
      context.router.push(const NotificationRoute());
}

@immutable
class _UserNameAndSubtitle extends StatelessWidget {
  const _UserNameAndSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Ken!',
                style: context.theme.textTheme.headingMedium24.copyWith(
                  color: context.theme.colors.white,
                ),
              ),
              Text(
                'We trust you are having a great time',
                style: context.theme.textTheme.bodyRegular12.copyWith(
                  color: context.theme.colors.gray1,
                ),
              ),
            ],
          ),
        ),
      );
}

@immutable
class _ActiveCards extends StatelessWidget {
  const _ActiveCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'What would you like to do',
                style: context.theme.textTheme.bodyMedium14.copyWith(
                  color: context.theme.colors.primary,
                ),
              ),
            ),
            Row(
              children: [
                _ActiveCard(
                  title: 'Customer Care',
                  subtitle:
                      'Our customer care service line is available from 8 -9pm week days'
                      ' and 9 - 5 weekends - tap to call us today',
                  icon: Assets.icons.callCenter,
                  onTap: () {},
                ),
                const SizedBox(width: 24),
                _ActiveCard(
                  title: 'Send a package',
                  subtitle:
                      'Request for a driver to pick up or deliver your package for you',
                  icon: Assets.icons.package,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _ActiveCard(
                  title: 'Fund your wallet',
                  subtitle:
                      'To fund your wallet is as easy as ABC, make use of '
                      'our fast technology and top-up your wallet today',
                  icon: Assets.icons.walletHome,
                  onTap: () {},
                ),
                const SizedBox(width: 24),
                _ActiveCard(
                  title: 'Chats',
                  subtitle: 'Search for available rider within your area',
                  icon: Assets.icons.chats,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      );
}

@immutable
class _ActiveCard extends ConsumerWidget {
  final String title;
  final String subtitle;
  final SvgGenImage icon;
  final VoidCallback onTap;

  const _ActiveCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            onTap: onTap,
            splashColor: context.theme.colors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            child: Ink(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                    color: context.theme.colors.black.withOpacity(0.15),
                  ),
                ],
                color: context.getColorPair(
                  context.theme.colors.gray6,
                  context.theme.colors.primaryS2,
                  ref,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: icon.svg(
                        colorFilter: ColorFilter.mode(
                          context.theme.colors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            context.theme.textTheme.subtitleMedium16.copyWith(
                          color: context.theme.colors.primary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        subtitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.textTheme.bodyRegular12.copyWith(
                          color: context.theme.colors.text4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
