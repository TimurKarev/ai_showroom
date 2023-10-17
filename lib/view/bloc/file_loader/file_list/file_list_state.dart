part of 'file_list_bloc.dart';

@immutable
sealed class FileListState {
  const FileListState();

  List<String> get files => switch (this) {
        FileListState$Loaded loaded => loaded.files,
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
    required this.files,
  });

  @override
  final List<String> files;
}
