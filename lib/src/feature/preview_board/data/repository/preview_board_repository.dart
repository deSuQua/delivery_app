import 'package:delivery_app/src/feature/preview_board/data/datasource/preview_board_local_db.dart';
import 'package:delivery_app/src/feature/preview_board/domain/repository/i_preview_board_repository.dart';
import 'package:flutter/foundation.dart';

@immutable
class PreviewBoardRepository implements IPreviewBoardRepository {
  final IPreviewBoardLocalDB _localDB;
  const PreviewBoardRepository({
    required IPreviewBoardLocalDB localDB,
  }) : _localDB = localDB;

  @override
  Future<bool?> isViewed() => _localDB.readFromLocalDB();

  @override
  Future<bool> update(final bool isViewed) =>
      _localDB.updateToLocalDB(isViewed);
}
