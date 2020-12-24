import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final Function() tapped;
  final Color backgroundColor;
  final Color textColor;
  final bool clickable;
  final double width;
  final String icon;
  final double bottomMargin;
  final bool isCenter;
  const ButtonText({
    Key key,
    @required this.title,
    @required this.tapped,
    @required this.bottomMargin,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.isCenter = true,
    this.clickable = true,
    this.width,
    this.icon = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: !clickable,
        child: InkWell(
            onTap: () => tapped(),
            child: Container(
                height: calHeightScale(44),
                margin: EdgeInsets.only(bottom: bottomMargin),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: textColor),
                  borderRadius: BorderRadius.circular(9999),
                  color: (clickable) ? backgroundColor : AppTheme.gray,
                ),
                width: width ?? calHeightScale(250),
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
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w700, color: textColor)),
                  ],
                ))));
  }
}
