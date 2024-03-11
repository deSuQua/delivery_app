import 'package:auto_route/annotations.dart';
import 'package:delivery_app/src/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

@immutable
@RoutePage<void>()
class AddPaymentMethodPage extends StatelessWidget {
  /// Экран "Добавить способ оплаты"
  const AddPaymentMethodPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PrimaryAppBar(
          title: Text('Add Payment method'),
        ),
      );
}
