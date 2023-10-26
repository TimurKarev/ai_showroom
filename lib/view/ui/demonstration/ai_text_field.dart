import 'package:flutter/material.dart';

class AiTextField extends StatefulWidget {
  const AiTextField({
    super.key,
    required this.onSend,
  });

  final void Function(String text) onSend;

  @override
  State<AiTextField> createState() => AiTextFieldState();
}

class AiTextFieldState extends State<AiTextField> {
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
