part of 'file_list_bloc.dart';

@immutable
sealed class FileListEvent {
  const FileListEvent();
}

final class FileListEvent$Started extends FileListEvent {
  const FileListEvent$Started();
}

final class FileListEvent$AddFile extends FileListEvent {
  const FileListEvent$AddFile(
    this.file,
  );

  final AppFile file;
}

final class FileListEvent$RemoveFile extends FileListEvent {
  const FileListEvent$RemoveFile({required this.fileReference});

  final AppFileReference fileReference;
}
