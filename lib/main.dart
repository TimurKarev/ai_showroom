import 'package:auth/data/use_case/auth/fire_login_use_case.dart';
import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:auth/view/bloc/auth/login/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => AuthBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) => switch (state) {
        _ => null,
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(switch (state) {
                      AuthState$User u => 'user ${u.user.toString()}',
                      AuthState$Error _ => 'error',
                      AuthState$AuthInitial _ => 'initial',
                    }),
                    Text(
                      state.auhted
                          ? 'You are logged in'
                          : 'You are not logged in',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              },
            ),
          ),
          floatingActionButton: BlocProvider(
            create: (context) => LoginBloc(FireLoginUseCase()),
            child: Builder(builder: (context) {
              return FloatingActionButton(
                onPressed: () => context.read<LoginBloc>().add(
                      const LoginEvent$Login(),
                    ),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              );
            }),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
