import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

import '../../main.dart';
import 'bloc/button_bloc.dart';
import 'button_text.dart';

class ButtonFAB extends StatelessWidget {
  final ButtonState state;
  final Function() nextPage;
  const ButtonFAB({Key key, @required this.state, @required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: (state is ButtonChanged)
            ? ButtonText(
                title: loc.main.continue_,
                tapped: () => nextPage(),
                backgroundColor: state.backgroundColor,
                textColor: state.textColor,
                bottomMargin: state.bottomMargin,
              )
            : ButtonText(
                title: loc.main.continue_,
                tapped: () => nextPage(),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                bottomMargin: calHeightScale(44),
              ));
  }
}
