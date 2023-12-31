import 'package:flutter/material.dart';

class FileTile extends StatelessWidget {
  const FileTile({
    super.key,
    required this.fileName,
    this.onDelete,
  });

  final String fileName;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: Card(
        elevation: 10,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(fileName),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
