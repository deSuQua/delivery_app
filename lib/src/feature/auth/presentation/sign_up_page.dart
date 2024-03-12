import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:delivery_app/src/feature/auth/bloc/auth.dart';
import 'package:delivery_app/src/feature/auth/di/auth_di.dart';
import 'package:delivery_app/src/feature/auth/presentation/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@RoutePage<void>()
class SignUpPage extends StatelessWidget {
  const SignUpPage({
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
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final ValueNotifier<bool> _termsConditionController;
  late final ValueNotifier<bool> _passwordShowController;
  late final ValueNotifier<bool> _confirmPasswordShowController;
  late final ValueNotifier<bool> _validator;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController()..addListener(_validate);
    _phoneController = TextEditingController()..addListener(_validate);
    _emailController = TextEditingController()..addListener(_validate);
    _passwordController = TextEditingController()..addListener(_validate);
    _confirmPasswordController = TextEditingController()
      ..addListener(_validate);
    _termsConditionController = ValueNotifier<bool>(false)
      ..addListener(_validate);
    _passwordShowController = ValueNotifier<bool>(false);
    _confirmPasswordShowController = ValueNotifier<bool>(false);
    _validator = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _fullNameController
      ..removeListener(_validate)
      ..dispose();
    _phoneController
      ..removeListener(_validate)
      ..dispose();
    _emailController
      ..removeListener(_validate)
      ..dispose();
    _passwordController
      ..removeListener(_validate)
      ..dispose();
    _confirmPasswordController
      ..removeListener(_validate)
      ..dispose();
    _termsConditionController
      ..removeListener(_validate)
      ..dispose();
    _passwordShowController.dispose();
    _confirmPasswordShowController.dispose();
    _validator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: context.mediaQuery.padding.top),
        child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 36,
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
                  title: 'Create an account',
                  subtitle: 'Complete the sign up process to get started',
                ),
                _SignInForm(
                  fullNameController: _fullNameController,
                  phoneController: _phoneController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  passwordShowController: _passwordShowController,
                  confirmPasswordShowController: _confirmPasswordShowController,
                ),
                _CheckBox(
                  termsConditionController: _termsConditionController,
                ),
                _BottomButton(
                  validator: _validator,
                  onTap: _onSignUp,
                ),
                const _SignInText(),
                GoogleButton(
                  text: 'or sign in using',
                  onTap: () {},
                ),
              ],
            )),
      );

  void _onSignUp() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phone = _phoneController.text.trim();
    final name = _fullNameController.text.trim();
    if (!EmailValidator.validate(_emailController.text)) {
      context.showSnackBar('Email не корректный');
      return;
    }

    context.container.read(AuthDI.bloc).add(AuthEvent.signUpEmail(
          email: email,
          password: password,
          phone: phone,
          name: name,
        ));
  }

  void _validate() =>
      _validator.value = _fullNameController.text.trim().isNotEmpty &&
          _phoneController.text.trim().isNotEmpty &&
          _emailController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty &&
          _confirmPasswordController.text.trim() ==
              _passwordController.text.trim() &&
          _termsConditionController.value;
}

@immutable
class _SignInForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueNotifier<bool> passwordShowController;
  final ValueNotifier<bool> confirmPasswordShowController;

  const _SignInForm({
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordShowController,
    required this.confirmPasswordShowController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: PrimaryTextField(
              labelText: 'Full name',
              hintText: 'Ivanov Ivan',
              controller: fullNameController,
            ),
          ),
          PrimaryTextField(
            labelText: 'Phone Number',
            hintText: '+7(999)999-99-99',
            controller: phoneController,
            keyboardType: TextInputType.phone,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: PrimaryTextField(
              labelText: 'Email Address',
              hintText: '***********@mail.com',
              controller: emailController,
            ),
          ),
          AnimatedBuilder(
            animation: passwordShowController,
            builder: (context, _) => PrimaryTextField(
              labelText: 'Password',
              hintText: '**********',
              controller: passwordController,
              suffixIcon: EyeSuffix(
                isShow: passwordShowController.value,
                onTap: () => passwordShowController.value =
                    !passwordShowController.value,
              ),
              suffixIconConstraints: BoxConstraints.loose(
                const Size(56, 40),
              ),
              obscureText: !passwordShowController.value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: AnimatedBuilder(
              animation: confirmPasswordShowController,
              builder: (context, _) => PrimaryTextField(
                labelText: 'Confirm Password',
                hintText: '**********',
                controller: confirmPasswordController,
                suffixIcon: EyeSuffix(
                  isShow: confirmPasswordShowController.value,
                  onTap: () => confirmPasswordShowController.value =
                      !confirmPasswordShowController.value,
                ),
                suffixIconConstraints: BoxConstraints.loose(
                  const Size(56, 40),
                ),
                obscureText: !confirmPasswordShowController.value,
              ),
            ),
          ),
        ],
      );
}

@immutable
class _CheckBox extends StatelessWidget {
  final ValueNotifier<bool> termsConditionController;

  const _CheckBox({
    required this.termsConditionController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AnimatedBuilder(
            animation: termsConditionController,
            builder: (BuildContext context, Widget? child) => Checkbox(
              value: termsConditionController.value,
              onChanged: (v) => termsConditionController.value =
                  !termsConditionController.value,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'By ticking this box, you agree to our ',
                style: context.theme.textTheme.bodyRegular12.copyWith(
                  color: context.theme.colors.gray2,
                ),
                children: [
                  TextSpan(
                    text: 'Terms and conditions and private policy',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: context.theme.textTheme.bodyRegular12.copyWith(
                      color: context.theme.colors.warning,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}

@immutable
class _BottomButton extends StatelessWidget {
  final ValueNotifier<bool> validator;
  final VoidCallback onTap;

  const _BottomButton({
    required this.validator,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 64),
        child: AnimatedBuilder(
          animation: validator,
          builder: (BuildContext context, Widget? child) =>
              DIBlocBuilder<AuthBloc, AuthState>(
            bloc: AuthDI.bloc,
            builder: (context, state) => PrimaryButton(
              onTap: validator.value ? onTap : null,
              isProgress: state.isProgress,
              text: 'Sign Up',
            ),
          ),
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

  Future<void> _onSignIn(BuildContext context) =>
      context.router.push(const LogInRoute());
}
