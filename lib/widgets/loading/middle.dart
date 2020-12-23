import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class Middle extends StatelessWidget {
  final Widget child;
  const Middle({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 100 - calHeightScale(100),
      child: Center(
        child: child,
      ),
    );
  }
}
