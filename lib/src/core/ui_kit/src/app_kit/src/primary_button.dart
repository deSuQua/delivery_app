import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:flutter/material.dart';

@immutable
class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isProgress;
  final VoidCallback? onTap;

  /// Главная кнопка
  const PrimaryButton({
    required this.text,
    required this.onTap,
    this.isProgress = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isProgress) {
      child = SizedBox.square(
        dimension: 24,
        child: CircularProgressIndicator(
          color: context.theme.colors.white,
          strokeWidth: 2,
        ),
      );
    } else {
      child = Text(text);
    }
    return ElevatedButton(
      onPressed: onTap,
      child: child,
    );
  }
}
