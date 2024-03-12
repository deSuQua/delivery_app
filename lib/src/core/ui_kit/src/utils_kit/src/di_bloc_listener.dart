import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class DIBlocListener<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocWidgetListener<S> listener;
  final ProviderBase<B> bloc;
  final Widget child;

  /// BlocListener with Consumer
  const DIBlocListener({
    required this.listener,
    required this.bloc,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) => BlocListener<B, S>(
          bloc: ref.watch(bloc),
          listener: listener,
          child: child,
        ),
        child: child,
      );
}
