part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthEvent$StartListenUser extends AuthEvent {
  const AuthEvent$StartListenUser();
}
