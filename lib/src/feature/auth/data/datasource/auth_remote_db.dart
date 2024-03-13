import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@immutable
abstract class IAuthRemoteDB {
  /// Получение пользователя
  User? readUser();

  /// Регистрация с помощью почты
  Future<User?> signUpWithEmail({
    required final String email,
    required final String password,
    required final String phone,
    required final String name,
  });

  /// Авторизация с помощью почты
  Future<User?> logInWithEmail({
    required final String email,
    required final String password,
  });

  /// Авторизация с помощью гугл аккаунта
  Future<User?> signInWithGoogle();

  /// Выход
  Future<void> logout();
}

@immutable
class AuthRemoteDB extends IAuthRemoteDB {
  final Supabase _remoteDB;

  AuthRemoteDB({
    required final Supabase remoteDB,
  }) : _remoteDB = remoteDB;

  @override
  User? readUser() => _remoteDB.client.auth.currentUser;

  @override
  Future<User?> signUpWithEmail({
    required final String email,
    required final String password,
    required final String phone,
    required final String name,
  }) async {
    final response = await _remoteDB.client.auth.signUp(
      email: email,
      password: password,
    );
    return response.user;
  }

  @override
  Future<User?> logInWithEmail({
    required final String email,
    required final String password,
  }) async {
    final response = await _remoteDB.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user;
  }

  @override
  Future<void> logout() async => await _remoteDB.client.auth.signOut();

  @override
  Future<User?> signInWithGoogle() async {
    await _remoteDB.client.auth.signInWithOAuth(
      OAuthProvider.google,
    );
    return _remoteDB.client.auth.currentUser;
  }
}
