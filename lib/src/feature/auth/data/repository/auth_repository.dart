import 'package:delivery_app/src/feature/auth/data/datasource/auth_remote_db.dart';
import 'package:delivery_app/src/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@immutable
class AuthRepository extends IAuthRepository {
  final IAuthRemoteDB _remoteDB;

  AuthRepository({
    required IAuthRemoteDB remoteDB,
  }) : _remoteDB = remoteDB;

  @override
  User? readUser() => _remoteDB.readUser();

  @override
  Future<User?> signUpWithEmail({
    required final String email,
    required final String password,
    required final String phone,
    required final String name,
  }) =>
      _remoteDB.signUpWithEmail(
        email: email,
        password: password,
        phone: phone,
        name: name,
      );

  @override
  Future<User?> logInWithEmail({
    required final String email,
    required final String password,
  }) =>
      _remoteDB.logInWithEmail(
        email: email,
        password: password,
      );

  @override
  Future<void> logout() => _remoteDB.logout();

  @override
  Future<User?> signInWithGoogle() => _remoteDB.signInWithGoogle();
}
