import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum ChatLineType {
  humanQuestion,
  aiAnswer,
  aiThinking,
  error,
}

class ChatLine extends StatelessWidget {
  const ChatLine({
    super.key,
    required this.type,
    required this.text,
  });

  final ChatLineType type;
  final String text;

  static const _avatarPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    IconData? leading = switch (type) {
      ChatLineType.aiAnswer => MdiIcons.monitor,
      ChatLineType.aiThinking => MdiIcons.monitor,
      ChatLineType.error => Icons.error,
      ChatLineType.humanQuestion => null,
    };

    IconData? trailing = switch (type) {
      ChatLineType.humanQuestion => Icons.man,
      _ => null,
    };

    return Row(
      children: [
        leading == null
            ? const Spacer()
            : Padding(
                padding: const EdgeInsets.only(right: _avatarPadding),
                child: _Avatar(icon: leading),
              ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: type == ChatLineType.aiThinking
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(text),
                ),
        ),
        trailing == null
            ? const Spacer()
            : Padding(
                padding: const EdgeInsets.only(left: _avatarPadding),
                child: _Avatar(icon: trailing),
              ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.icon,
  });

  final IconData icon;

  static const _avatarRadius = 40.0;
  static const _iconSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _avatarRadius,
      child: Icon(
        icon,
        size: _iconSize,
      ),
    );
  }
}
