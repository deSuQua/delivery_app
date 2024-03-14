import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/assets.gen.dart';
import 'package:delivery_app/src/core/ui_kit/src/app_kit/app_kit.dart';
import 'package:delivery_app/src/feature/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
@RoutePage<void>(name: 'WalletTab')
class WalletPage extends StatelessWidget {
  /// Экран "Кошелек"
  const WalletPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PrimaryAppBar(title: Text('Wallet')),
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
  Widget build(BuildContext context) => const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                top: 32,
              ),
              child: UserCard(),
            ),
            _WalletActions(),
            _TransactionHistory(),
          ],
        ),
      );
}

@immutable
class _WalletActions extends ConsumerWidget {
  const _WalletActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Ink(
          decoration: BoxDecoration(
            color: context.getColorPair(
              context.theme.colors.gray1,
              context.theme.colors.primaryS2,
              ref,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 10,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Top Up',
                    style: context.theme.textTheme.subtitleBold16.copyWith(
                      color: context.getColorPair(
                        context.theme.colors.text4,
                        context.theme.colors.white,
                        ref,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _WalletActionButton(
                      icon: Assets.icons.bank,
                      title: 'Bank',
                      onTap: () {},
                    ),
                    _WalletActionButton(
                      icon: Assets.icons.transfer,
                      title: 'Transfer',
                      onTap: () {},
                    ),
                    _WalletActionButton(
                      icon: Assets.icons.walletCard,
                      title: 'Card',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

@immutable
class _WalletActionButton extends ConsumerWidget {
  final SvgGenImage icon;
  final String title;
  final VoidCallback? onTap;
  const _WalletActionButton({
    required this.icon,
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          IconButton(
            onPressed: onTap,
            style: IconButton.styleFrom(
              maximumSize: const Size.square(48),
              minimumSize: const Size.square(48),
              foregroundColor: context.theme.colors.white,
              backgroundColor: context.theme.colors.primary,
            ),
            icon: icon.svg(
              colorFilter: ColorFilter.mode(
                context.getColorPair(context.theme.colors.white,
                    context.theme.colors.primaryS2, ref),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: context.theme.textTheme.bodyRegular12.copyWith(
              color: context.getColorPair(
                  context.theme.colors.text4, context.theme.colors.white, ref),
            ),
          ),
        ],
      );
}

@immutable
class _TransactionHistory extends ConsumerWidget {
  const _TransactionHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
              style: context.theme.textTheme.headingMedium20.copyWith(
                color: context.getColorPair(context.theme.colors.text4,
                    context.theme.colors.white, ref),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Text(
                  'List is empty',
                  style: context.theme.textTheme.bodyMedium14.copyWith(
                    color: context.theme.colors.gray2,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
