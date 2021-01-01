import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class Avatar extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  const Avatar({Key key, @required this.path, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? calHeightScale(166),
        height: height ?? calHeightScale(166),
        child: Image.asset(
          path,
          fit: BoxFit.fitHeight,
        ));
  }
}
