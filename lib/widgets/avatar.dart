import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class Avatar extends StatelessWidget {
  final String path;
  const Avatar({Key key, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: calHeightScale(166),
        height: calHeightScale(166),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ));
  }
}
