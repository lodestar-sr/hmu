import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

class CheckMarkText extends StatelessWidget {
  final String text;
  const CheckMarkText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: calHeightScale(33),
      child: Row(
        children: [
          ButtonIcon(
            icon: ProjectIcons.checkMark,
            width: calHeightScale(20),
            padding: 0,
          ),
          SizedBox(
            width: calWidthScale(12),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
