import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

import '../../main.dart';

class TryAgain extends StatelessWidget {
  final String message;
  final Function() tapped;
  final Color color;
  const TryAgain(
      {Key key,
      @required this.message,
      @required this.tapped,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonIcon(
            icon: ProjectIcons.reload,
            iconColor: Colors.black,
            tapped: () => tapped(),
          ),
          Text(
            message ?? loc.main.try_again,
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
          )
        ],
      ),
    );
  }
}
