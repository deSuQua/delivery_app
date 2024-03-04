import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:delivery_app/src/feature/auth/presentation/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class LogInPage extends StatelessWidget {
  /// Страница авторизации
  const LogInPage({
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
  /// Тело экрана
  const _BodyLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<_BodyLayout> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<_BodyLayout> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final ValueNotifier<bool> _rememberMeController;
  late final ValueNotifier<bool> _passwordShowController;
  late final ValueNotifier<bool> _validator;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(_validate);
    _passwordController = TextEditingController()..addListener(_validate);

    _rememberMeController = ValueNotifier<bool>(false)..addListener(_validate);
    _passwordShowController = ValueNotifier<bool>(false);
    _validator = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _emailController
      ..removeListener(_validate)
      ..dispose();
    _passwordController
      ..removeListener(_validate)
      ..dispose();
    _rememberMeController
      ..removeListener(_validate)
      ..dispose();
    _passwordShowController.dispose();
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
                title: 'Welcome Back',
                subtitle: 'Fill in your email and password to continue',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: PrimaryTextField(
                  labelText: 'Email Address',
                  hintText: '***********@mail.com',
                  controller: _emailController,
                ),
              ),
              AnimatedBuilder(
                animation: _passwordShowController,
                builder: (context, _) => PrimaryTextField(
                  labelText: 'Password',
                  hintText: '**********',
                  controller: _passwordController,
                  suffixIcon: EyeSuffix(
                    isShow: _passwordShowController.value,
                    onTap: () => _passwordShowController.value =
                        !_passwordShowController.value,
                  ),
                  suffixIconConstraints: BoxConstraints.loose(
                    const Size(56, 40),
                  ),
                  obscureText: !_passwordShowController.value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    _RememberMeCheckBox(
                        rememberMeController: _rememberMeController),
                    const _ForgotPasswordButton(),
                  ],
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
      _validator.value = EmailValidator.validate(_emailController.text) &&
          _passwordController.text.trim().isNotEmpty;
}

@immutable
class _RememberMeCheckBox extends StatelessWidget {
  final ValueNotifier<bool> rememberMeController;

  const _RememberMeCheckBox({
    required this.rememberMeController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: rememberMeController,
              builder: (BuildContext context, Widget? child) => SizedBox.square(
                dimension: 24,
                child: Checkbox(
                  value: rememberMeController.value,
                  onChanged: (v) => _onChanged(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: GestureDetector(
                onTap: _onChanged,
                child: Text(
                  'Remember password',
                  style: context.theme.textTheme.bodyMedium12.copyWith(
                    color: context.theme.colors.gray2,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void _onChanged() => rememberMeController.value = !rememberMeController.value;
}

@immutable
class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 16,
        child: Text(
          'Forgot Password?',
          style: context.theme.textTheme.bodyMedium12.copyWith(
            color: context.theme.colors.primary,
          ),
        ),
        onPressed: () => _onForgotPassword(context),
      );

  void _onForgotPassword(BuildContext context) =>
      context.router.push(const ForgotPasswordRoute());
}

@immutable
class _BottomLayout extends StatelessWidget {
  final ValueNotifier<bool> validator;

  const _BottomLayout({
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: validator,
              builder: (BuildContext context, Widget? child) => ElevatedButton(
                onPressed: validator.value ? () => _onLogin(context) : null,
                child: const Text('Log in'),
              ),
            ),
            const _SignUpText(),
            Padding(
              padding: EdgeInsets.only(
                bottom: 24 +
                    context.mediaQuery.padding.bottom +
                    context.mediaQuery.viewInsets.bottom,
              ),
              child: GoogleButton(
                text: 'or sign in using',
                onTap: () {},
              ),
            ),
          ],
        ),
      );

  void _onLogin(BuildContext context) =>
      context.router.push(const RootRouterRoute());
}

@immutable
class _SignUpText extends StatelessWidget {
  const _SignUpText({
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
                text: 'Dont have an account? ',
                style: context.theme.textTheme.bodyRegular14.copyWith(
                  color: context.theme.colors.gray2,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _onSignUp(context),
                    style: context.theme.textTheme.bodyRegular14.copyWith(
                      color: context.theme.colors.primary,
                    ),
                  ),
                ]),
          ),
        ),
      );

  Future<void> _onSignUp(BuildContext context) =>
      context.router.push(const SignUpRoute());
}
