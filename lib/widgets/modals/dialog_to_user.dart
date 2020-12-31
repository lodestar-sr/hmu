import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_text.dart';

class DialogToUser extends StatelessWidget {
  final String header;
  final String body;
  final String action;
  final Function tapped;
  const DialogToUser(
      {Key key,
      @required this.header,
      @required this.body,
      @required this.action,
      @required this.tapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(
          horizontal: calWidthScale(24), vertical: calHeightScale(47)),
      width: calWidthScale(307),
      height: calHeightScale(392),
      child: Column(
        children: [
          Text(
            header,
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: calHeightScale(40),
          ),
          Text(
            body,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          ButtonText(
              title: action,
              tapped: () {
                Navigator.pop(context);
                tapped();
              },
              bottomMargin: 0)
        ],
      ),
    );
  }
}
