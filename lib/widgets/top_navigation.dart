import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

import 'buttons/button_icon.dart';

class TopNavigation extends StatelessWidget {
  final String title;
  const TopNavigation({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: calHeightScale(74),
      alignment: Alignment.centerLeft,
      child: Column(children: [
        ButtonIcon(
            icon: ProjectIcons.chervonLeft,
            iconColor: Colors.black,
            tapped: () {
              Navigator.pop(context);
            }),
        Container(
          margin: EdgeInsets.only(
            top: calHeightScale(22),
          ),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(fontWeight: FontWeight.w600),
          ),
        )
      ]),
    );
  }
}
