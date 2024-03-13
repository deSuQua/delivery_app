import 'package:delivery_app/src/feature/app/di/app_di.dart';
import 'package:delivery_app/src/feature/preview_board/bloc/preview_board.dart';
import 'package:delivery_app/src/feature/preview_board/data/datasource/preview_board_local_db.dart';
import 'package:delivery_app/src/feature/preview_board/data/repository/preview_board_repository.dart';
import 'package:delivery_app/src/feature/preview_board/domain/repository/i_preview_board_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
abstract class PreviewBoardDI {
  static final _localDB = Provider.autoDispose<IPreviewBoardLocalDB>(
    (ref) => PreviewBoardLocalDB(localDB: ref.watch(AppDI.localStorage)),
  );

  static final _repository = Provider.autoDispose<IPreviewBoardRepository>(
    (ref) => PreviewBoardRepository(localDB: ref.watch(_localDB)),
  );

  static final bloc = Provider.autoDispose<PreviewBoardBloc>((ref) {
    final bloc = PreviewBoardBloc(repository: ref.watch(_repository))
      ..add(const PreviewBoardEvent.read());
    ref.onDispose(bloc.close);
    return bloc;
  });
}
