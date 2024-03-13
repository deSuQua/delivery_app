import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/feature/preview_board/bloc/preview_board.dart';
import 'package:delivery_app/src/feature/preview_board/di/preview_board_di.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class PreviewBoardPage extends StatelessWidget {
  /// Экран "Приветственный экран"
  const PreviewBoardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: _BodyLayout(),
      );
}

@immutable
class _BodyLayout extends StatefulWidget {
  const _BodyLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<_BodyLayout> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<_BodyLayout> {
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _Page(
            title: 'Quick Delivery At Your Doorstep',
            subtitle: 'Enjoy quick pick-up and delivery to your destination',
            icon: Assets.icons.preview1,
            controller: _pageController,
            onSkip: _skip,
            onMainButton: _nextTab,
          ),
          _Page(
            title: 'Flexible Payment',
            subtitle:
                'Different modes of payment either before and after delivery without stress',
            icon: Assets.icons.preview2,
            controller: _pageController,
            onSkip: _skip,
            onMainButton: _nextTab,
          ),
          _Page(
            title: 'Real-time Tracking',
            subtitle:
                'Track your packages/items from the comfort of your home till final destination',
            icon: Assets.icons.preview3,
            controller: _pageController,
            onMainButton: () => context.router.replace(
              const SignUpRoute(),
            ),
          ),
        ],
      );

  void _skip() {
    context.container
        .read(PreviewBoardDI.bloc)
        .add(const PreviewBoardEvent.update(isViewed: true));
    _pageController.animateToPage(2,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  void _nextTab() {
    if (_pageController.page?.round() == 1) {
      context.container
          .read(PreviewBoardDI.bloc)
          .add(const PreviewBoardEvent.update(isViewed: true));
    }
    _pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }
}

@immutable
class _Page extends StatelessWidget {
  final String title;
  final String subtitle;
  final SvgGenImage icon;
  final PageController controller;
  final VoidCallback? onSkip;
  final VoidCallback onMainButton;
  const _Page({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.controller,
    required this.onMainButton,
    this.onSkip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
                left: 24,
                right: 24,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: icon.svg(),
              ),
            ),
            _TitleWithSubtitle(
              title: title,
              subtitle: subtitle,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 20,
                right: 20,
              ),
              child: _Buttons(
                onMainButton: onMainButton,
                onSkip: onSkip,
              ),
            )
          ],
        ),
      );
}

@immutable
class _Buttons extends StatelessWidget {
  final VoidCallback? onSkip;
  final VoidCallback onMainButton;
  const _Buttons({
    required this.onMainButton,
    this.onSkip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onSkip == null) {
      return Column(
        children: [
          ElevatedButton(
            onPressed: onMainButton,
            child: const Text('Sign Up'),
          ),
          const _SignInText(),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: onSkip,
          style: OutlinedButton.styleFrom(
            maximumSize: const Size(100, 50),
            minimumSize: const Size(100, 50),
          ),
          child: const Text('Skip'),
        ),
        ElevatedButton(
          onPressed: onMainButton,
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(100, 50),
            minimumSize: const Size(100, 50),
          ),
          child: const Text('Next'),
        ),
      ],
    );
  }
}

@immutable
class _TitleWithSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const _TitleWithSubtitle({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 48,
          right: 48,
          top: 48,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: context.theme.textTheme.headingBold24.copyWith(
                color: context.theme.colors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: context.theme.textTheme.bodyRegular16.copyWith(
                color: context.theme.colors.text4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}

@immutable
class _SignInText extends StatelessWidget {
  const _SignInText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 24,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Already have an account? ',
              style: context.theme.textTheme.bodyRegular14.copyWith(
                color: context.theme.colors.gray2,
              ),
              children: [
                TextSpan(
                  text: 'Sign in',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _onSignIn(context),
                  style: context.theme.textTheme.bodyRegular14.copyWith(
                    color: context.theme.colors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _onSignIn(BuildContext context) {
    return context.router.pushAndPopUntil(
      const LogInRoute(),
      predicate: (_) => false,
    );
  }
}
