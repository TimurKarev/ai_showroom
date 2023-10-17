import 'dart:io';

import 'package:auth/data/use_case/files_list/write_files_list_use_case.dart';
import 'package:auth/view/bloc/auth/auth/auth_bloc.dart';
import 'package:auth/view/bloc/file_loader/file_list/file_list_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/files/app_file.dart';

class FileLoaderPage extends StatelessWidget {
  const FileLoaderPage({super.key});

  Future<File?> _pickFile() async {
    final file = await FilePicker.platform.pickFiles();

    return file != null ? File(file.files.single.path ?? '') : null;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.userOrNull;

    if (user?.id case final String userId when userId.isNotEmpty) {
      return BlocProvider(
        create: (context) => FileListBloc(
          WriteFilesListUseCase(),
          userId: userId,
        ),
        child: Builder(
          builder: (context) {
            final fileListBloc = context.read<FileListBloc>();
            return Column(
              children: [
                TextButton(
                  onPressed: () async {
                    final fileOrNull = await _pickFile();
                    if (fileOrNull case final File file) {
                      fileListBloc.add(
                        FileListEvent$AddFile(
                          AppFile(
                            file: file,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Add File'),
                ),
                BlocBuilder<FileListBloc, FileListState>(
                  builder: (context, state) {
                    return Row(
                      children: state.files
                          .map(
                            (file) => Text(file),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
