import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';

@immutable
@RoutePage<void>()
class NewPasswordPage extends StatelessWidget {
  /// Экран "Новый пароль"
  const NewPasswordPage({
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
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final ValueNotifier<bool> _passwordShowController;
  late final ValueNotifier<bool> _confirmPasswordShowController;
  late final ValueNotifier<bool> _validator;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController()..addListener(_validate);
    _confirmPasswordController = TextEditingController()
      ..addListener(_validate);
    _passwordShowController = ValueNotifier<bool>(false);
    _confirmPasswordShowController = ValueNotifier<bool>(false);
    _validator = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _passwordController
      ..removeListener(_validate)
      ..dispose();
    _confirmPasswordController
      ..removeListener(_validate)
      ..dispose();
    _passwordShowController.dispose();
    _confirmPasswordShowController.dispose();
    _validator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: 110 + context.mediaQuery.padding.top,
          left: 24,
          right: 24,
          bottom: 24 +
              context.mediaQuery.padding.bottom +
              context.mediaQuery.viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthTitleText(
                title: 'New Password',
                subtitle: 'Enter new password',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: AnimatedBuilder(
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
              ),
              AnimatedBuilder(
                animation: _confirmPasswordShowController,
                builder: (context, _) => PrimaryTextField(
                  labelText: 'Confirm Password',
                  hintText: '**********',
                  controller: _confirmPasswordController,
                  suffixIcon: EyeSuffix(
                    isShow: _confirmPasswordShowController.value,
                    onTap: () => _confirmPasswordShowController.value =
                        !_confirmPasswordShowController.value,
                  ),
                  suffixIconConstraints: BoxConstraints.loose(
                    const Size(56, 40),
                  ),
                  obscureText: !_confirmPasswordShowController.value,
                ),
              ),
              _BottomLayout(
                validator: _validator,
              ),
            ],
          ),
        ),
      );

  void _validate() => _validator.value = _passwordController.text
          .trim()
          .isNotEmpty &&
      _confirmPasswordController.text.trim() == _passwordController.text.trim();
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
                onPressed: validator.value ? () => _onLogIn(context) : null,
                child: const Text('Log in'),
              ),
            ),
          ],
        ),
      );

  Future<void> _onLogIn(BuildContext context) async {}
}
