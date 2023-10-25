import 'package:auth/domain/failers/chat_failure.dart';
import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/use_cases/demonstration/chat_use_case.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class FireChatUseCase implements ChatUseCase {
  static const _httpFunctionUrl =
      "https://us-central1-moto-pattaya.cloudfunctions.net/";

  @override
  Future<Either<Failure, String>> askQuestion({
    required String question,
    required String collectionName,
  }) async {
    const functionName = 'ask_question';

    try {
      final result =
          await get(Uri.parse('$_httpFunctionUrl$functionName'), headers: {
        'question': question,
        'collection_name': collectionName,
      });
      // final result =
      //     await FirebaseFunctions.instance.httpsCallable('ask_question').call({
      //   'question': question,
      //   'collection_name': collectionName,
      // });
      return Right(result.body);
    } on FirebaseFunctionsException catch (e) {
      return Left(
        SomeChatFailure(
          message: e.details.toString(),
        ),
      );
    }
  }
}
