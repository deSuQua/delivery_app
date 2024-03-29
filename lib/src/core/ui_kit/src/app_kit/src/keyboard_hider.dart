import 'package:flutter/material.dart';

@immutable
class KeyboardHider extends StatelessWidget {
  final Widget child;

  const KeyboardHider({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: child,
      );
}
