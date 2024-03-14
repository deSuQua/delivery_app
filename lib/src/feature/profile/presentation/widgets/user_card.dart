import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class UserCard extends StatefulWidget {
  /// Карточка пользователя
  const UserCard({
    Key? key,
  }) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
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
            const Avatar(),
            _UserNameAndBalance(
              hideBalanceController: _hideBalanceController,
            ),
            AnimatedBuilder(
              animation: _hideBalanceController,
              builder: (context, child) => EyeSuffix(
                isShow: !_hideBalanceController.value,
                onTap: () => _hideBalanceController.value =
                    !_hideBalanceController.value,
              ),
            ),
          ],
        ),
      );
}

@immutable
class _UserNameAndBalance extends ConsumerWidget {
  final ValueNotifier<bool> hideBalanceController;

  /// Имя и баланс
  const _UserNameAndBalance({
    required this.hideBalanceController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Ken',
                style: context.theme.textTheme.subtitleMedium16.copyWith(
                  color: context.getColorPair(
                    context.theme.colors.text4,
                    context.theme.colors.white,
                    ref,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedBuilder(
                animation: hideBalanceController,
                builder: (context, child) => RichText(
                  text: TextSpan(
                    text: 'Current balance: ',
                    style: context.theme.textTheme.bodyRegular12.copyWith(
                      color: context.getColorPair(
                        context.theme.colors.text4,
                        context.theme.colors.white,
                        ref,
                      ),
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
