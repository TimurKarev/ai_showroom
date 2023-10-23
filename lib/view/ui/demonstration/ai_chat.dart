import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:auth/view/bloc/demonstration/chat/chat_bloc.dart';
import 'package:auth/view/ui/demonstration/ai_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiChat extends StatelessWidget {
  const AiChat({
    super.key,
    this.collectionName,
  });

  final String? collectionName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AiTextField(
          onSend: (text) => context.read<ChatBloc>().add(
                ChatEvent$AskQuestion(
                  question: text,
                  collectionName: collectionName ??
                      context.read<AuthBloc>().state.userOrNull?.id ??
                      '',
                ),
              ),
        ),
        Placeholder(),
      ],
    );
  }
}
