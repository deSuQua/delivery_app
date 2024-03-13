import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class ForgotPasswordPage extends StatelessWidget {
  /// Экран забыли пароль
  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const KeyboardHider(
        child: Scaffold(
          body: _BodyLayout(),
        ),
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
  late final TextEditingController _emailController;
  late final ValueNotifier<bool> _validator;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(_validate);
    _validator = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _emailController
      ..removeListener(_validate)
      ..dispose();
    _validator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: context.mediaQuery.padding.top,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 110,
            left: 24,
            right: 24,
            bottom: 24 +
                context.mediaQuery.padding.bottom +
                context.mediaQuery.viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthTitleText(
                title: 'Forgot Password',
                subtitle: 'Enter your email address',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 56),
                child: PrimaryTextField(
                  labelText: 'Email Address',
                  hintText: '***********@mail.com',
                  controller: _emailController,
                ),
              ),
              _BottomLayout(
                validator: _validator,
              ),
            ],
          ),
        ),
      );

  void _validate() =>
      _validator.value = EmailValidator.validate(_emailController.text);
}

@immutable
class _BottomLayout extends StatelessWidget {
  final ValueNotifier<bool> validator;

  const _BottomLayout({
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AnimatedBuilder(
            animation: validator,
            builder: (BuildContext context, Widget? child) => ElevatedButton(
              onPressed: validator.value ? () => _onSendOTP(context) : null,
              child: const Text('Send OTP'),
            ),
          ),
          const _SignInText(),
        ],
      );

  Future<void> _onSendOTP(BuildContext context) =>
      context.router.push(const AuthCodeRoute());
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
                text: 'Remember password? Back to ',
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
                ]),
          ),
        ),
      );

  Future<void> _onSignIn(BuildContext context) => context.router.pop();
}
