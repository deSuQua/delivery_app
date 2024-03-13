import 'package:flutter/foundation.dart';

@immutable
abstract class IPreviewBoardRepository {
  /// Получение статуса просмотра превью борда
  Future<bool?> isViewed();

  /// Обновление статуса просмотра превью борда
  Future<bool> update(final bool isViewed);
}
