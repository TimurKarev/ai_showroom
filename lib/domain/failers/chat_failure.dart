import 'package:auth/domain/failers/failer.dart';

sealed class ChatFailure extends Failure {
  const ChatFailure({
    required super.message,
  });
}

class SomeChatFailure extends ChatFailure {
  SomeChatFailure({required super.message});
}
