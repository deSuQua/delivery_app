import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
abstract class IPreviewBoardLocalDB {
  /// Получение статуса просмотра превью борда
  Future<bool?> readFromLocalDB();

  /// Обновление статуса просмотра превью борда
  Future<bool> updateToLocalDB(final bool isViewed);
}

@immutable
class PreviewBoardLocalDB implements IPreviewBoardLocalDB {
  final SharedPreferences _localDB;

  const PreviewBoardLocalDB({
    required final SharedPreferences localDB,
  }) : _localDB = localDB;
  String get _key => 'preview-board';

  @override
  Future<bool?> readFromLocalDB() async => _localDB.getBool(_key);

  @override
  Future<bool> updateToLocalDB(final bool isViewed) async =>
      _localDB.setBool(_key, true);
}
