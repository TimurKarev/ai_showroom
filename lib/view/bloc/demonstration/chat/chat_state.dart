part of 'chat_bloc.dart';

@immutable
sealed class ChatState {
  const ChatState();
}

class ChatState$Idle extends ChatState {
  const ChatState$Idle();
}

class ChatState$AiThinking extends ChatState {
  const ChatState$AiThinking({required this.question});

  final String question;
}

class ChatState$AnswerSuccess extends ChatState {
  const ChatState$AnswerSuccess({
    required this.answer,
  });

  final String answer;
}

class ChatState$Error extends ChatState {
  const ChatState$Error();
}
