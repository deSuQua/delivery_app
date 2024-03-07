import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme.freezed.dart';

@freezed
class AppThemeEvent with _$AppThemeEvent {
  const AppThemeEvent._();

  const factory AppThemeEvent.toggle() = _ToggleAppThemeEvent;
}

@freezed
class AppThemeState with _$AppThemeState {
  bool get isDarkMode => map(
        light: (_) => false,
        dark: (_) => true,
      );

  const AppThemeState._();

  const factory AppThemeState.light() = LightAppThemeState;

  const factory AppThemeState.dark() = DarkAppThemeState;
}

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppThemeState.light()) {
    on<AppThemeEvent>(
      (event, emit) => event.map(
        toggle: (event) => _toggle(event, emit),
      ),
    );
  }

  Future<void> _toggle(
    final _ToggleAppThemeEvent event,
    Emitter<AppThemeState> emit,
  ) async {
    if (state.isDarkMode) {
      emit(const AppThemeState.light());
    } else {
      emit(const AppThemeState.dark());
    }
  }
}
