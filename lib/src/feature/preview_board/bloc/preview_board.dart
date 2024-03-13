import 'package:delivery_app/src/feature/preview_board/domain/repository/i_preview_board_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_board.freezed.dart';

@freezed
abstract class PreviewBoardEvent with _$PreviewBoardEvent {
  const PreviewBoardEvent._();

  const factory PreviewBoardEvent.read() = _ReadPreviewBoardEvent;

  const factory PreviewBoardEvent.update({
    required final bool isViewed,
  }) = _UpdatePreviewBoardEvent;
}

@freezed
abstract class PreviewBoardState with _$PreviewBoardState {
  const PreviewBoardState._();

  const factory PreviewBoardState.idle({
    required final bool isViewed,
  }) = _IdlePreviewBoardState;
}

class PreviewBoardBloc extends Bloc<PreviewBoardEvent, PreviewBoardState> {
  final IPreviewBoardRepository _repository;

  PreviewBoardBloc({
    required IPreviewBoardRepository repository,
  })  : _repository = repository,
        super(const PreviewBoardState.idle(isViewed: false)) {
    on<PreviewBoardEvent>((event, emit) => event.map(
          read: (event) => _read(event, emit),
          update: (event) => _update(event, emit),
        ));
  }

  Future<void> _read(
    _ReadPreviewBoardEvent event,
    Emitter<PreviewBoardState> emit,
  ) async {
    try {
      final isViewed =
          await _repository.isViewed().timeout(const Duration(seconds: 10));
      emit(PreviewBoardState.idle(isViewed: isViewed ?? false));
    } on Object catch (_) {
      emit(const PreviewBoardState.idle(isViewed: false));
    }
  }

  Future<void> _update(
    _UpdatePreviewBoardEvent event,
    Emitter<PreviewBoardState> emit,
  ) async {
    final isViewed = await _repository
        .update(event.isViewed)
        .timeout(const Duration(seconds: 10));
    PreviewBoardState.idle(isViewed: isViewed);
  }
}
