import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/router/router.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

@immutable
@RoutePage<void>()
class AuthCodePage extends StatelessWidget {
  /// Экран "Верификация"
  const AuthCodePage({
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
  late final TextEditingController _codeController;
  late final ValueNotifier<bool> _validator;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController()..addListener(_validate);
    _validator = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _codeController
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
                title: 'OTP Verification',
                subtitle: 'Enter the 6 digit numbers sent to your email',
              ),
              _Pinput(
                codeController: _codeController,
              ),
              const _PinPutInfoText(),
              _BottomLayout(
                validator: _validator,
              ),
            ],
          ),
        ),
      );

  void _validate() =>
      _validator.value = _codeController.text.trim().length == 6;
}

@immutable
class _Pinput extends StatelessWidget {
  final TextEditingController codeController;

  const _Pinput({
    required this.codeController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 70,
          bottom: 12,
        ),
        child: Pinput(
          length: 6,
          controller: codeController,
          defaultPinTheme: _submittedPinTheme(context).copyWith(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.theme.colors.gray2,
              ),
            ),
          ),
          submittedPinTheme: _submittedPinTheme(context),
          focusedPinTheme: _submittedPinTheme(context),
          errorPinTheme: _submittedPinTheme(context).copyWith(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.theme.colors.error,
              ),
            ),
          ),
          forceErrorState: false,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          keyboardType: TextInputType.number,
        ),
      );

  PinTheme _submittedPinTheme(BuildContext context) => PinTheme(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.colors.primary,
          ),
        ),
        textStyle: context.theme.textTheme.bodyRegular14.copyWith(
          color: Colors.black,
        ),
      );
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
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: validator,
              builder: (BuildContext context, Widget? child) => ElevatedButton(
                onPressed:
                    validator.value ? () => _onNewPassword(context) : null,
                child: const Text('Set New Password'),
              ),
            ),
          ],
        ),
      );

  Future<void> _onNewPassword(BuildContext context) =>
      context.router.push(const NewPasswordRoute());
}

@immutable
class _PinPutInfoText extends StatelessWidget {
  const _PinPutInfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'If you didn’t receive code, resend after 1:00',
          style: context.theme.textTheme.bodyRegular14.copyWith(
            color: context.theme.colors.gray2,
          ),
          textAlign: TextAlign.center,
        ),
      );
}
