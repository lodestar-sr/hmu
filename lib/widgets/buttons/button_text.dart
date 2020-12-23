import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final Function() tapped;
  final Color backgroundColor;
  final Color textColor;
  final double margin;
  final bool clickable;
  final double width;
  final String icon;
  final bool isCenter;
  const ButtonText({
    Key key,
    @required this.title,
    @required this.tapped,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.isCenter = true,
    this.clickable = true,
    this.width,
    this.margin,
    this.icon = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: !clickable,
        child: InkWell(
            onTap: () => tapped(),
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: margin ?? SizeConfig.verticalMargin),
                height: calHeightScale(44),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (clickable) ? backgroundColor : AppTheme.gray,
                ),
                width: width ?? SizeConfig.widthMultiplier * 100,
                child: Row(
                  mainAxisAlignment: (isCenter)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: icon.isNotEmpty,
                        child: ButtonIcon(
                          icon: icon,
                          backgroundColor: backgroundColor,
                          iconColor: textColor,
                        )),
                    Text(title,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontWeight: FontWeight.w400, color: textColor)),
                  ],
                ))));
  }
}
