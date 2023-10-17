import 'dart:async';

import 'package:auth/domain/models/auth/user/app_user.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with ChangeNotifier {
  AuthBloc() : super(const AuthState$AuthInitial()) {
    on<AuthEvent$StartListenUser>(_listenUser);
    on<AuthEvent$Logout>(_logout);

    add(const AuthEvent$StartListenUser());
  }

  Future<void> _listenUser(
    AuthEvent$StartListenUser event,
    Emitter<AuthState> emitter,
  ) async {
    await emitter.forEach(FirebaseAuth.instance.authStateChanges(),
        onData: (user) {
      Future.delayed(
        const Duration(seconds: 1),
        notifyListeners,
      );
      return _userChanged(user);
    });
  }

  Future<void> _logout(
    AuthEvent$Logout event,
    Emitter<AuthState> emitter,
  ) async {
    await FirebaseAuth.instance.signOut();
  }

  AuthState _userChanged(User? user) {
    if (user == null) {
      return const AuthState$UnknownUser();
    }

    if (user case final User realUser) {
      return realUser.isAnonymous
          ? AuthState$AnonymousUser(
              AppUser(
                isAnonymous: true,
                id: realUser.uid,
              ),
            )
          : AuthState$RegisteredUser(
              AppUser(
                isAnonymous: false,
                id: realUser.uid,
              ),
            );
    }
  }
}
