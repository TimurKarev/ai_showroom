import 'package:auth/view/theme/color_palette.dart';
import 'package:auth/view/ui/common/contact_form/contact_form_small.dart';
import 'package:auth/view/ui/common/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    this.color = Colors.white,
  });

  final Color color;

  static const _height = 270.0;
  static const _breadPadding = 100.0;
  static const _iconPadding = 20.0;
  static const _contactFormWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      decoration: const BoxDecoration(
        color: ColorPalette.footer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 100.0,
          vertical: 16.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Row(
                children: [
                  Logo(color: color),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: _breadPadding),
                    child: Text(
                      'bread crumbs',
                      style: TextStyle(color: color),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: _breadPadding),
                    child: Text(
                      'bread crumbs',
                      style: TextStyle(color: color),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: _breadPadding),
                    child: Text(
                      'bread crumbs',
                      style: TextStyle(color: color),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: _iconPadding),
                    child: Icon(MdiIcons.facebook, color: color),
                  ),
                  Icon(MdiIcons.instagram, color: color),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text('Связаться с нами',
                        style: TextStyle(color: color)),
                  ),
                  ContactFormSmall(
                    width: _contactFormWidth,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Divider(color: color),
            ),
            Text(
              '© 2022',
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
