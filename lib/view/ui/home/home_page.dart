import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:auth/view/ui/file_loader/file_loader_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(
                  const AuthEvent$Logout(),
                ),
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Text(title),
      ),
      body: const FileLoaderPage(),
    );
  }
}
