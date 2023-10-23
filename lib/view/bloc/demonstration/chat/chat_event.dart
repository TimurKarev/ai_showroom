part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {
  const ChatEvent();
}

class ChatEvent$AskQuestion extends ChatEvent {
  const ChatEvent$AskQuestion({
    required this.question,
    required this.collectionName,
  });

  final String question;
  final String collectionName;
}
