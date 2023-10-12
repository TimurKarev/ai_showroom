part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();

  bool get auhted => switch (this) {
        AuthState$User user => user.user?.uid != null,
        _ => false,
      };
}

class AuthState$AuthInitial extends AuthState {
  const AuthState$AuthInitial();
}

class AuthState$User extends AuthState {
  const AuthState$User(this.user);

  final User? user;
}

class AuthState$Error extends AuthState {
  const AuthState$Error();
}
