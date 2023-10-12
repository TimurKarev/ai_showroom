import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/use_cases/auth/login_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireLoginUseCase implements LoginUseCase<void> {
  FireLoginUseCase();

  final _fire = FirebaseAuth.instance;

  @override
  Future<Either<Failure, bool>> login({credentials}) async {
    try {
      final user = await _fire.signInAnonymously();
      return Right(user.user != null);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }
}
