part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();

  AppUser? get userOrNull => switch (this) {
        AuthState$AuthInitial _ || AuthState$UnknownUser _ => null,
        AuthState$Error errorState => errorState.user,
        AuthState$RegisteredUser userState => userState.user,
        AuthState$AnonymousUser userState => userState.user,
      };
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
  const AuthState$Error(this.user);

  final AppUser? user;
}
