import 'dart:io';

class AppFile {
  const AppFile({
    required this.file,
  });

  final File file;

  String get name => file.path.split('/').last;
}
