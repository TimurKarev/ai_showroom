import 'package:auth/data/http/dio_client.dart';
import 'package:auth/internal/navigation/go_router.dart';
import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DioClient.djangoLocal(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(),
          )
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              ),
              useMaterial3: true,
            ),
            routerConfig: goRouter(context.read<AuthBloc>()),
          );
        }),
      ),
    );
  }
}
