import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class DIBlocConsumer<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocWidgetListener<S> listener;
  final BlocWidgetBuilder<S> builder;
  final ProviderBase<B> bloc;
  final bool Function(S, S)? listenWhen;

  /// BlocListener with Consumer
  const DIBlocConsumer({
    required this.listener,
    required this.builder,
    required this.bloc,
    this.listenWhen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) => BlocConsumer<B, S>(
          bloc: ref.watch(bloc),
          listener: listener,
          builder: builder,
          listenWhen: listenWhen,
        ),
      );
}
