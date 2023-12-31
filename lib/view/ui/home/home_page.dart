import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:auth/view/ui/common/logo/logo.dart';
import 'package:auth/view/ui/demonstration/demonstration.dart';
import 'package:auth/view/ui/home/call_to_action.dart';
import 'package:auth/view/ui/home/description.dart';
import 'package:auth/view/ui/home/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const _appBarTitleSpacing = 150.0;
  static const _appBarExpandedHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: _appBarTitleSpacing,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(
                  const AuthEvent$Logout(),
                ),
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Logo(),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: _appBarExpandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Крутой и призывающий заголовок'),
              background: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Description(),
                const Demonstration(),
                const CallToAction(),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
