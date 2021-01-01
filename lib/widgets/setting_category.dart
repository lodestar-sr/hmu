import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_settings.dart';

class SettingCategory extends StatelessWidget {
  final String title;
  final List<ButtonSettings> children;
  const SettingCategory(
      {Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.edgeMargin),
      padding: EdgeInsets.only(top: calHeightScale(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: calHeightScale(10)),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: calHeightScale(13),
                  fontWeight: FontWeight.w600,
                  color: Colors.black38),
            ),
          ),
          ...children
        ],
      ),
    );
  }
}
