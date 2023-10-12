import 'package:auth/domain/failers/failer.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUseCase<T> {
  Future<Either<Failure, bool>> login({T? credentials});
}
