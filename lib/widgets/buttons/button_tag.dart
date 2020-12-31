import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class ButtonTag extends StatelessWidget {
  final String text;
  final bool isActive;
  const ButtonTag({
    Key key,
    @required this.text,
    @required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: calHeightScale(15), vertical: calHeightScale(10)),
      margin: EdgeInsets.only(left: calWidthScale(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        color: isActive ? Colors.black : AppTheme.middleGray,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4.copyWith(
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : Colors.black),
      ),
    );
  }
}
