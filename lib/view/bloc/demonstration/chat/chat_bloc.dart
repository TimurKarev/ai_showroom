import 'dart:async';

import 'package:auth/domain/use_cases/demonstration/chat_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._useCase,
  ) : super(const ChatState$Idle()) {
    on<ChatEvent$AskQuestion>(_askQuestion);
  }

  final ChatUseCase _useCase;

  Future<void> _askQuestion(
    ChatEvent$AskQuestion event,
    Emitter<ChatState> emitter,
  ) async {
    emitter(const ChatState$Loading());
    final result = await _useCase.askQuestion(
      question: event.question,
      collectionName: event.collectionName,
    );

    result.fold(
      (l) => emitter(const ChatState$Error()),
      (answer) => emitter(ChatState$AnswerSuccess(answer: answer)),
    );
  }
}
