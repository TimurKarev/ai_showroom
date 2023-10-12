import 'package:auth/domain/use_cases/auth/login_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._useCase,
  ) : super(const LoginState$Initial()) {
    on<LoginEvent$Login>(_login);
  }

  final LoginUseCase _useCase;

  Future<void> _login(
    LoginEvent$Login event,
    Emitter<LoginState> emitter,
  ) async {
    emitter(const LoginState$InProgress());
    final result = await _useCase.login();

    result.fold(
      (l) => emitter(const LoginState$Error()),
      (r) => emitter(const LoginState$Idle()),
    );
  }
}
