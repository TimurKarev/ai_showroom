import 'package:auth/domain/failers/failer.dart';
import 'package:auth/domain/models/files/app_file.dart';
import 'package:auth/domain/models/files/app_file_reference.dart';
import 'package:auth/domain/use_cases/file_loader/files_list_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireFilesListUseCase implements FilesListUseCase {
  FireFilesListUseCase();

  static const _rootPath = 'user_files/';

  final storage = FirebaseStorage.instance.ref();

  @override
  Future<Either<Failure, List<AppFileReference>>> getFilesList(
      {required String userId}) async {
    final pathRef = storage.child(
      _getFilePath(userId),
    );
    final files = await pathRef.listAll();
    final fileList = <AppFileReference>[];
    for (final fileName in files.items) {
      fileList.add(fileName.toAppFileReference(userId));
    }

    return Right(fileList);
  }

  @override
  Future<Either<Failure, void>> uploadFile({
    required String userId,
    required AppFile file,
  }) async {
    final pathRef = storage
        .child('${_getFilePath(userId)}/${file.file.path.split('/').last}');
    await pathRef.putFile(file.file);

    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> removeFile({
    required String userId,
    required String fileName,
  }) async {
    final pathRef = storage.child('${_getFilePath(userId)}/$fileName');
    await pathRef.delete();

    return const Right(null);
  }

  String _getFilePath(String userId) => '$_rootPath$userId';
}

extension ReferenceMapperExtension on Reference {
  AppFileReference toAppFileReference(String id) => AppFileReference(
        uid: id,
        fileName: name,
        path: fullPath,
      );
}
