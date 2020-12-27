import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

import 'buttons/button_icon.dart';

class TopNavigation extends StatelessWidget {
  final String title;
  const TopNavigation({
    this.title = "",
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: calHeightScale(((title.isEmpty) ? 74 : 150)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ButtonIcon(
            icon: ProjectIcons.chervonLeft,
            iconColor: Colors.black,
            tapped: () {
              Navigator.pop(context);
            }),
        Visibility(
          visible: title.isNotEmpty,
          child: Container(
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
          ),
        )
      ]),
    );
  }
}
