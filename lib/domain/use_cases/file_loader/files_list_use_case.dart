import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/models/files/app_file.dart';
import 'package:auth/domain/models/files/app_file_reference.dart';
import 'package:dartz/dartz.dart';

abstract class FilesListUseCase {
  Future<Either<Failure, List<AppFileReference>>> getFilesList({
    required String userId,
  });

  Future<Either<Failure, void>> uploadFile({
    required String userId,
    required AppFile file,
  });

  Future<Either<Failure, void>> removeFile({
    required String userId,
    required String fileName,
  });
}
