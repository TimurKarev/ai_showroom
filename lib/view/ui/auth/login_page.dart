import 'package:auth/data/use_case/auth/fire_login_use_case.dart';
import 'package:auth/view/bloc/auth/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => LoginBloc(FireLoginUseCase()),
          child: Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: () => context.read<LoginBloc>().add(
                    const LoginEvent$Login(),
                  ),
              child: const Icon(Icons.login),
            );
          }),
        ),
      ),
    );
  }
}
