import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class Loading extends StatelessWidget {
  final double margin;
  final Color backgroundColor;
  final double width;
  final Color iconColor;
  const Loading({
    Key key,
    this.margin,
    this.width,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: iconColor,
        size: calHeightScale(22),
      ),
    );
  }
}
