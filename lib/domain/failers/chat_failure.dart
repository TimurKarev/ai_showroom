import 'package:auth/domain/failers/failer.dart';

sealed class ChatFailure extends Failure {
  const ChatFailure({
    required super.message,
  });
}

class ChatFailure$Unknown extends ChatFailure {
  ChatFailure$Unknown({required super.message});
}

class ChatFailure$EmptyMessage extends ChatFailure {
  const ChatFailure$EmptyMessage() : super(message: 'Chat message is empty');
}
