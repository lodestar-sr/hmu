import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            if (state is ButtonChanged)
              return ButtonText(
                title: loc.main.continue_,
                tapped: () => nextPage(),
                backgroundColor: state.backgroundColor,
                textColor: state.textColor,
                bottomMargin: state.bottomMargin,
              );
            else
              return ButtonText(
                title: loc.main.continue_,
                tapped: () => nextPage(),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                bottomMargin: calHeightScale(44),
              );
          },
        ));
  }
}
