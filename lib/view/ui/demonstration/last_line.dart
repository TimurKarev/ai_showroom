import 'package:auth/view/bloc/demonstration/chat/chat_bloc.dart';
import 'package:auth/view/ui/common/chat/chat_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastLine extends StatelessWidget {
  const LastLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Column(
        children: [
          _Question(),
          const SizedBox(height: 30.0),
          _Answer(),
        ],
      ),
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
            ? ChatLine(
                type: ChatLineType.humanQuestion,
                text: state.question,
              )
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
        ChatState$AnswerSuccess _ =>
          ChatLine(text: state.answer, type: ChatLineType.aiAnswer),
        ChatState$AiThinking _ =>
          const ChatLine(text: '', type: ChatLineType.aiThinking),
        ChatState$Error _ =>
          const ChatLine(text: 'Error', type: ChatLineType.aiAnswer),
        _ => const SizedBox(),
      },
    );
  }
}
