import 'package:auth/data/http/dio_client.dart';
import 'package:auth/data/http/use_cases/dio_chat_use_case.dart';
import 'package:auth/view/bloc/demonstration/chat/chat_bloc.dart';
import 'package:auth/view/ui/demonstration/ai_chat.dart';
import 'package:auth/view/ui/home/demonstration_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Demonstration extends StatefulWidget {
  const Demonstration({super.key});

  @override
  State<Demonstration> createState() => _DemonstrationState();
}

class _DemonstrationState extends State<Demonstration> {
  var _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        DioChatUseCase(context.read<DioClient>()),
      ),
      child: Column(children: [
        DemonstrationButtons(
            index: _tabIndex,
            onPressed: (index) {
              setState(() {
                _tabIndex = index;
              });
            }),
        const AiChat(
          collectionName: 'test',
        ),
      ]),
    );
  }
}
