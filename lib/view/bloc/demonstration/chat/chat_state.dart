part of 'chat_bloc.dart';

@immutable
sealed class ChatState {
  const ChatState();
}

class ChatState$Idle extends ChatState {
  const ChatState$Idle();
}

class ChatState$Loading extends ChatState {
  const ChatState$Loading();
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
