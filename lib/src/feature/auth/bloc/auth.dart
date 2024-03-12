import 'package:delivery_app/src/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.read() = _ReadAuthEvent;

  const factory AuthEvent.signUpEmail({
    required final String email,
    required final String password,
    required final String phone,
    required final String name,
  }) = _SignUpEmailAuthEvent;

  const factory AuthEvent.logInEmail({
    required final String email,
    required final String password,
  }) = _LogInEmailAuthEvent;

  const factory AuthEvent.google() = _GoogleAuthEvent;

  const factory AuthEvent.logout() = _LogoutAuthEvent;
}

@freezed
abstract class AuthState with _$AuthState {
  bool get isProgress => maybeMap(
        orElse: () => false,
        progress: (_) => true,
      );

  const AuthState._();

  const factory AuthState.idle({
    required User? user,
  }) = _IdleAuthState;

  const factory AuthState.progress({
    required User? user,
  }) = _ProgressAuthState;

  const factory AuthState.success({
    required User? user,
  }) = _SuccessAuthState;

  const factory AuthState.error({
    required User? user,
  }) = _ErrorAuthState;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository;

  AuthBloc({
    required final IAuthRepository repository,
  })  : _repository = repository,
        super(const AuthState.idle(user: null)) {
    on<AuthEvent>((event, emit) => event.map(
          read: (event) => _read(event, emit),
          signUpEmail: (event) => _signUpEmail(event, emit),
          logInEmail: (event) => _logInEmail(event, emit),
          google: (event) => _google(event, emit),
          logout: (event) => _logout(event, emit),
        ));
  }

  Future<void> _read(
    final _ReadAuthEvent event,
    final Emitter<AuthState> emit,
  ) async {
    try {
      final user = _repository.readUser();

      emit(AuthState.idle(user: user));
    } on Object catch (e) {
      emit(AuthState.error(user: state.user));
    }
  }

  Future<void> _signUpEmail(
    final _SignUpEmailAuthEvent event,
    final Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthState.progress(user: state.user));

      final user = await _repository
          .signUpWithEmail(
            email: event.email,
            password: event.password,
            phone: event.phone,
            name: event.name,
          )
          .timeout(const Duration(seconds: 10));

      emit(AuthState.idle(user: user));
    } on Object catch (e) {
      print(e);
      emit(AuthState.error(user: state.user));
    } finally {
      if (state.user != null) {
        emit(AuthState.success(user: state.user));
      } else {
        emit(const AuthState.error(user: null));
      }
    }
  }

  Future<void> _logInEmail(
    final _LogInEmailAuthEvent event,
    final Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthState.progress(user: state.user));

      final user = await _repository
          .logInWithEmail(
            email: event.email,
            password: event.password,
          )
          .timeout(const Duration(seconds: 10));

      emit(AuthState.idle(user: user));
    } on Object catch (e) {
      emit(AuthState.error(user: state.user));
    } finally {
      if (state.user != null) {
        emit(AuthState.success(user: state.user));
      } else {
        emit(const AuthState.error(user: null));
      }
    }
  }

  Future<void> _google(
    final _GoogleAuthEvent event,
    final Emitter<AuthState> emit,
  ) async {}

  Future<void> _logout(
    final _LogoutAuthEvent event,
    final Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthState.progress(user: state.user));
      await _repository.logout().timeout(const Duration(seconds: 10));
      emit(const AuthState.success(user: null));
    } on Object catch (e) {
      emit(AuthState.error(user: state.user));
    } finally {
      emit(AuthState.progress(user: state.user));
    }
  }
}
