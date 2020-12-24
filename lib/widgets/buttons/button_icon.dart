import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class ButtonIcon extends StatelessWidget {
  final String icon;
  final Function tapped;
  final Color iconColor;
  final bool clickable;
  final Color backgroundColor;
  final double width;
  final double height;
  final double padding;
  const ButtonIcon(
      {Key key,
      @required this.icon,
      this.tapped,
      this.clickable = true,
      this.padding,
      this.height,
      this.width,
      this.iconColor = Colors.black,
      this.backgroundColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: !clickable,
        child: InkWell(
          onTap: () => tapped(),
          child: Container(
            width: width ?? calHeightScale(34),
            height: height ?? calHeightScale(34),
            padding: EdgeInsets.all(padding ?? calHeightScale(10)),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              icon,
              color: iconColor,
            ),
          ),
        ));
  }
}
