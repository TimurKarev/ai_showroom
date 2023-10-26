import 'package:auth/view/bloc/demonstration/chat/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastLine extends StatelessWidget {
  const LastLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Question(),
        _Answer(),
      ],
    );
  }
}

class _Question extends StatelessWidget {
  const _Question();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) => current is ChatState$AiThinking,
      builder: (_, state) {
        return state is ChatState$AiThinking
            ? Text(state.question)
            : SizedBox();
      },
    );
  }
}

class _Answer extends StatelessWidget {
  const _Answer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (_, state) => switch (state) {
        ChatState$AnswerSuccess _ => Text(state.answer),
        ChatState$AiThinking _ => const CircularProgressIndicator(),
        ChatState$Error _ => const Text('Error'),
        _ => const SizedBox(),
      },
    );
  }
}
