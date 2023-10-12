part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {
  const LoginEvent();
}

final class LoginEvent$Login extends LoginEvent {
  const LoginEvent$Login();
}
