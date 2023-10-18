part of 'file_list_bloc.dart';

@immutable
sealed class FileListState {
  const FileListState();

  List<AppFileReference> get filesReference => switch (this) {
        FileListState$Loaded loaded => loaded.filesReference,
        _ => [],
      };
}

class FileListState$Initial extends FileListState {
  const FileListState$Initial();
}

class FileListState$Fetching extends FileListState {
  const FileListState$Fetching();
}

class FileListState$Error extends FileListState {
  const FileListState$Error();
}

class FileListState$Loaded extends FileListState {
  const FileListState$Loaded({
    required this.filesReference,
  });

  @override
  final List<AppFileReference> filesReference;
}
