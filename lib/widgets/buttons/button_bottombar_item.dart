import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class ButtonBottomBarItem extends StatelessWidget {
  final String path;
  final bool isMain;
  const ButtonBottomBarItem({Key key, @required this.path, this.isMain = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: calHeightScale((isMain) ? 39 : 24),
      height: calHeightScale((isMain) ? 39 : 24),
      child: Image.asset(path),
    );
  }
}
