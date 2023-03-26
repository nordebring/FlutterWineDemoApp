part of 'remote_login_cubit.dart';

abstract class RemoteLoginState extends Equatable {
  final String email;
  final String password;
  final DioError? error;

  const RemoteLoginState({
    this.email = '',
    this.password = '',
    this.error,
  });

  @override
  List<Object?> get props => [email, password, error];
}

class RemoteLoginUpdate extends RemoteLoginState {
  const RemoteLoginUpdate({super.email, super.password});
}

class RemoteLoginSuccess extends RemoteLoginState {
  const RemoteLoginSuccess();
}

class RemoteLoginFailed extends RemoteLoginState {
  const RemoteLoginFailed({super.error});
}
