import 'package:auth/domain/failers/chat_failure.dart';
import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/use_cases/demonstration/chat_use_case.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';

class FireChatUseCase implements ChatUseCase {
  @override
  Future<Either<Failure, String>> askQuestion({
    required String question,
    required String collectionName,
  }) async {
    try {
      final result =
          await FirebaseFunctions.instance.httpsCallable('addMessage').call();
      return Right(result.data.toString());
    } on FirebaseFunctionsException catch (e) {
      return Left(
        SomeChatFailure(
          message: e.details.toString(),
        ),
      );
    }
  }
}
