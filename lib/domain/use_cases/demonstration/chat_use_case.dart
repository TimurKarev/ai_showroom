import 'package:auth/domain/failers/failer.dart';
import 'package:dartz/dartz.dart';

abstract class ChatUseCase {
  Future<Either<Failure, String>> askQuestion({
    required String question,
    required String collectionName,
  });
}
