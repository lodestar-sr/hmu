import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

import 'buttons/button_icon.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: calHeightScale(74),
      child: Container(
          child: ButtonIcon(
              icon: ProjectIcons.chervonLeft,
              iconColor: Colors.black,
              tapped: () {
                Navigator.pop(context);
              })),
    );
  }
}
