import 'package:flutter/material.dart';

class ContactFormSmall extends StatelessWidget {
  const ContactFormSmall({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: const Placeholder(
        child: Text('ContactFormSmall'),
      ),
    );
  }
}
