import 'package:auth/view/ui/demonstration/ai_text_field.dart';
import 'package:flutter/material.dart';

class AiChat extends StatelessWidget {
  const AiChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AiTextField(
          onSend: (text) => print(text),
        ),
        Placeholder(),
      ],
    );
  }
}
