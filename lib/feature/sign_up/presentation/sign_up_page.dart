import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/core/extenstion/extenstions.dart';
import 'package:flutter/material.dart';

@RoutePage<void>()
class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Heading -Bold 36',
            style: context.theme.textTheme.headingMedium24.copyWith(
              color: context.theme.colors.text3,
            ),
          ),
        ),
        body: const Placeholder(),
      );
}
