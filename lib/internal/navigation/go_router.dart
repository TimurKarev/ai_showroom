import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:auth/view/ui/auth/landing_page.dart';
import 'package:auth/view/ui/auth/login_page.dart';
import 'package:auth/view/ui/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter(Listenable listenable) => GoRouter(
      refreshListenable: listenable,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        )
      ],
      redirect: (context, state) {
        final authState = context.read<AuthBloc>().state;

        return state.fullPath != '/login'
            ? switch (authState) {
                AuthState$AuthInitial _ => null,
                AuthState$UnknownUser _ => '/login',
                _ => '/home',
              }
            : switch (authState) {
                AuthState$AnonymousUser _ ||
                AuthState$RegisteredUser _ =>
                  '/home',
                _ => null,
              };
      },
    );
