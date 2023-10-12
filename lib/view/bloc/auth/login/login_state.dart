part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  const LoginState();
}

class LoginState$Initial extends LoginState {
  const LoginState$Initial();
}

class LoginState$InProgress extends LoginState {
  const LoginState$InProgress();
}

class LoginState$Error extends LoginState {
  const LoginState$Error();
}

class LoginState$Idle extends LoginState {
  const LoginState$Idle();
}
