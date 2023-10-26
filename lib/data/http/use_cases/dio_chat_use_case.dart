import 'package:auth/data/http/dio_client.dart';
import 'package:auth/domain/failers/chat_failure.dart';
import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/use_cases/demonstration/chat_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioChatUseCase implements ChatUseCase {
  const DioChatUseCase(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<Either<Failure, String>> askQuestion({
    required String question,
    required String collectionName,
  }) async {
    try {
      final result = await _dioClient.get<String>(
        'ask-question',
        queryParameters: {
          'question': question,
          'collection_name': collectionName,
        },
      );

      if (result.data case final String message when message.isNotEmpty) {
        return Right(message);
      }

      return const Left(
        ChatFailure$EmptyMessage(),
      );
    } on DioException catch (e) {
      return Left(
        ChatFailure$Unknown(
          message: e.message ?? 'empty error Dio message',
        ),
      );
    }
  }
}
