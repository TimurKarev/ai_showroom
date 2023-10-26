import 'package:auth/view/models/card_tile_model.dart';
import 'package:auth/view/ui/demonstration/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const _topWidgetSize = 100.0;

final _buttons = [
  CardTileModel(
    topWidget: Icon(
      MdiIcons.brain,
      size: _topWidgetSize,
    ),
    title: 'Чат Бот',
    text: 'Задайте вопрос модели, которая отвечает по нашему PDF-файлу.',
    type: CardTileType.watch,
  ),
  CardTileModel(
    topWidget: Icon(
      MdiIcons.headSnowflake,
      size: _topWidgetSize,
    ),
    title: 'Чат бот',
    text: 'Загрузите свой пдф файл и расспросите модель о нем.',
    type: CardTileType.add,
  ),
  CardTileModel(
    topWidget: Icon(
      MdiIcons.sigma,
      size: _topWidgetSize,
    ),
    title: 'Суммаризейшн',
    text:
        'Посмотрите, как модель способна понимать и обобщать текст из вашего PDF-файла.',
    type: CardTileType.disable,
  ),
];

class DemonstrationButtons extends StatelessWidget {
  const DemonstrationButtons({
    super.key,
    required this.index,
    this.onPressed,
  });

  final int index;
  final void Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _buttons.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                onPressed?.call(i);
              },
              child: CardTile(
                topWidgetOffset: _topWidgetSize * 0.33,
                topWidget: _buttons[i].topWidget,
                title: _buttons[i].title,
                text: _buttons[i].text,
                type: _buttons[i].type,
                isActive: index == i,
              ),
            ),
          ),
      ],
    );
  }
}
