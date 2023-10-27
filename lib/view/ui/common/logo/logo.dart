import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.color,
  });

  final Color? color;

  static const _title = 'AI LLM';

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 34,
      ),
    );
  }
}
