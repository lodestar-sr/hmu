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
  final double height;
  final String icon;
  final double bottomMargin;
  final bool isCenter;
  final int fontSize;
  final int index;
  final bool haveBorder;
  final double iconPadding;
  final int currentIndex;
  const ButtonText(
      {Key key,
      @required this.title,
      @required this.tapped,
      @required this.bottomMargin,
      this.backgroundColor = Colors.black,
      this.textColor = Colors.white,
      this.isCenter = true,
      this.clickable = true,
      this.haveBorder = true,
      this.width,
      this.height,
      this.icon = "",
      this.index = -1,
      this.iconPadding,
      this.currentIndex = 0,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: !clickable,
        child: InkWell(
            onTap: () => tapped(),
            child: Container(
                height: height ?? calHeightScale(44),
                margin: EdgeInsets.only(bottom: bottomMargin),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: (!clickable)
                          ? Colors.transparent
                          : (haveBorder)
                              ? Colors.black
                              : Colors.transparent),
                  borderRadius: BorderRadius.circular(9999),
                  color: (index != -1)
                      ? (currentIndex == index)
                          ? Colors.black
                          : Colors.white
                      : (!clickable)
                          ? AppTheme.middleGray
                          : backgroundColor,
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
                          clickable: clickable,
                          padding: iconPadding,
                          backgroundColor: backgroundColor,
                          iconColor: (index != -1)
                              ? (currentIndex == index)
                                  ? Colors.white
                                  : Colors.black
                              : textColor,
                        )),
                    Text(title,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: calHeightScale(
                                  fontSize * SizeConfig.mostafaScaleNumber),
                              fontWeight: FontWeight.w700,
                              color: (index != -1)
                                  ? (currentIndex == index)
                                      ? Colors.white
                                      : Colors.black
                                  : textColor,
                            )),
                  ],
                ))));
  }
}
