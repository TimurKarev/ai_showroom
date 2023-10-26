import 'package:auth/view/theme/color_palette.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    this.padding = const EdgeInsets.only(top: 80, bottom: 90),
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Демонстрация как можно научить искуственный интеллект по вашим документам',
            ),
          ),
          Container(
            width: 100.0,
            height: 3.0,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Вы можете поговорить с нашей моделью обученной при помощи pdf файла или загрузить свой pdf и спросить модель о нем",
            ),
          ),
        ],
      ),
    );
  }
}
