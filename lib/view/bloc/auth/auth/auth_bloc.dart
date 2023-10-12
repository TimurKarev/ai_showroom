import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState$AuthInitial()) {
    on<AuthEvent>(_listenUser);

    add(const AuthEvent$StartListenUser());
  }

  Future<void> _listenUser(
    AuthEvent event,
    Emitter<AuthState> emitter,
  ) async {
    await emitter.forEach(FirebaseAuth.instance.authStateChanges(),
        onData: (user) => AuthState$User(user));
  }
}
