import 'package:auth/view/models/card_tile_model.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    this.isActive = false,
    required this.topWidget,
    required this.topWidgetOffset,
    required this.title,
    required this.text,
    required this.type,
  });

  final bool isActive;
  final Widget topWidget;
  final double topWidgetOffset;
  final String title;
  final String text;
  final CardTileType type;

  static const _height = 308.0;
  static const _width = 287.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: Card(
        elevation: isActive ? 1 : 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Transform.translate(
                  offset: Offset(0, -topWidgetOffset),
                  child: topWidget,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(text),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(type.icon),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
