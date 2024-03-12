import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class DIBlocBuilder<B extends BlocBase<S>, S> extends StatelessWidget {
  final BlocWidgetBuilder<S> builder;
  final ProviderBase<B> bloc;

  /// BlocBuilder with Consumer
  const DIBlocBuilder({
    required this.builder,
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocBuilder<B, S>(
          bloc: ref.watch(bloc),
          builder: builder,
        ),
      );
}
