import 'package:flutter/material.dart';

class AiChat extends StatelessWidget {
  const AiChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextField(
          onSend: (text) => print(text),
        ),
        Placeholder(),
      ],
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({required this.onSend});

  final void Function(String text) onSend;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 20.0,
      ),
      child: Row(children: [
        Expanded(
          child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              )),
        ),
        IconButton(
          onPressed: () {
            widget.onSend(_textController.text);
            _textController.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ]),
    );
  }
}
