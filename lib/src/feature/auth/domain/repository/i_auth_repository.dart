import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@immutable
abstract class IAuthRepository {
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
