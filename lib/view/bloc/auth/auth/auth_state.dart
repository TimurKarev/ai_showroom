part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

class AuthState$AuthInitial extends AuthState {
  const AuthState$AuthInitial();
}

class AuthState$UnknownUser extends AuthState {
  const AuthState$UnknownUser();
}

class AuthState$RegisteredUser extends AuthState {
  const AuthState$RegisteredUser(this.user);

  final AppUser user;
}

class AuthState$AnonymousUser extends AuthState {
  const AuthState$AnonymousUser(this.user);

  final AppUser user;
}

class AuthState$Error extends AuthState {
  const AuthState$Error();
}
