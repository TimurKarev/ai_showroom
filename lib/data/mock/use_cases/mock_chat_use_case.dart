import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/use_cases/demonstration/chat_use_case.dart';
import 'package:dartz/dartz.dart';

class MockChatUseCase implements ChatUseCase {
  static const _delay = 1;

  @override
  Future<Either<Failure, String>> askQuestion({
    String question = '',
    String collectionName = '',
  }) =>
      Future.delayed(
        const Duration(seconds: _delay),
        () => const Right('Answer'),
      );
}
