import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),

                  /// TODO: add localization
                  child: Text(
                    'Header',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: const Text(
                    'descrioption, description dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription dedescription de',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Call To Action'),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Icon(MdiIcons.brain, size: 64),
          ),
        ],
      ),
    );
  }
}
