import 'package:auth/domain/models/files/app_file.dart';
import 'package:auth/domain/models/files/app_file_reference.dart';
import 'package:auth/domain/use_cases/file_loader/files_list_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'file_list_event.dart';
part 'file_list_state.dart';

class FileListBloc extends Bloc<FileListEvent, FileListState> {
  FileListBloc(
    this._useCase, {
    required this.userId,
  }) : super(
          const FileListState$Initial(),
        ) {
    on<FileListEvent$Started>(_started);
    on<FileListEvent$AddFile>(_addFile);
    on<FileListEvent$RemoveFile>(_removeFile);

    add(const FileListEvent$Started());
  }

  final FilesListUseCase _useCase;
  final String userId;

  Future<void> _started(
    FileListEvent$Started event,
    Emitter<FileListState> emitter,
  ) async {
    emitter(const FileListState$Fetching());

    final filesResponse = await _useCase.getFilesList(
      userId: userId,
    );

    filesResponse.fold(
      (l) => emitter(
        const FileListState$Error(),
      ),
      (r) => emitter(
        FileListState$Loaded(
          filesReference: r,
        ),
      ),
    );
  }

  Future<void> _addFile(
    FileListEvent$AddFile event,
    Emitter<FileListState> emitter,
  ) async {
    /// emit some state
    await _useCase.uploadFile(
      userId: userId,
      file: event.file,
    );

    add(const FileListEvent$Started());
  }

  Future<void> _removeFile(
    FileListEvent$RemoveFile event,
    Emitter<FileListState> emitter,
  ) async {
    await _useCase.removeFile(
      userId: userId,
      fileName: event.fileReference.fileName,
    );

    add(const FileListEvent$Started());
  }
}
