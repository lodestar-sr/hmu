import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

import '../main.dart';

class Logo extends StatelessWidget {
  final Color color;
  const Logo({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: ButtonIcon(
          icon: ProjectIcons.icon,
          iconColor: color,
          width: calWidthScale(65),
          height: calHeightScale(65),
          clickable: false,
        )),
        Container(
          child: Text(
            loc.main.hmu,
            style: TextStyle(
                fontSize: calHeightScale(48),
                fontWeight: FontWeight.w600,
                color: color,
                fontFamily: "Eina01"),
          ),
        )
      ],
    );
  }
}
