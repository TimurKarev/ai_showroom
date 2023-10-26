import 'package:flutter/material.dart';

class CardTileModel {
  const CardTileModel({
    required this.topWidget,
    required this.title,
    required this.text,
    required this.type,
  });

  final Widget topWidget;
  final String title;
  final String text;
  final CardTileType type;
}

enum CardTileType {
  disable,
  watch,
  add,
  ;

  IconData get icon {
    switch (this) {
      case CardTileType.disable:
        return Icons.login;
      case CardTileType.watch:
        return Icons.watch;
      case CardTileType.add:
        return Icons.add;
    }
  }
}
