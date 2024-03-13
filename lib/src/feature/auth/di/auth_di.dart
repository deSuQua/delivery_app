import 'package:delivery_app/src/feature/app/di/app_di.dart';
import 'package:delivery_app/src/feature/auth/bloc/auth.dart';
import 'package:delivery_app/src/feature/auth/data/datasource/auth_remote_db.dart';
import 'package:delivery_app/src/feature/auth/data/repository/auth_repository.dart';
import 'package:delivery_app/src/feature/auth/domain/repository/i_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthDI {
  static final _remoteDB = Provider.autoDispose<IAuthRemoteDB>(
    (ref) => AuthRemoteDB(remoteDB: ref.watch(AppDI.supabase)),
  );
  static final _repository = Provider.autoDispose<IAuthRepository>(
    (ref) => AuthRepository(
      remoteDB: ref.watch(_remoteDB),
    ),
  );

  static final bloc = Provider.autoDispose<AuthBloc>((ref) {
    final bloc = AuthBloc(
      repository: ref.watch(_repository),
    )..add(const AuthEvent.read());
    ref.onDispose(bloc.close);
    return bloc;
  });
}
