import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_text.dart';
import 'package:hmu/widgets/input_form.dart/input_form.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../injection_container.dart';
import '../../../main.dart';

class GetPhoneNumberPage extends StatefulWidget {
  final bool isLogin;
  GetPhoneNumberPage({Key key, @required this.isLogin}) : super(key: key);

  @override
  _GetPhoneNumberPageState createState() => _GetPhoneNumberPageState();
}

class _GetPhoneNumberPageState extends State<GetPhoneNumberPage> {
  String phone = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<ButtonBloc>(),
        child: BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      children: [
                        TopNavigation(),
                        SizedBox(height: calHeightScale(186)),
                        InputForm(
                          placeHolder: loc.main.phone_number,
                          hint: loc.main.enter_your_phone_number,
                          maxLentgh: 11,
                          onChanged: (text) {
                            phone = text;
                          },
                          onFocused: (isFocused) {
                            (isFocused)
                                ? buttonChanger(context, Colors.black,
                                    Colors.white, calHeightScale(123))
                                : buttonChanger(context, Colors.white,
                                    Colors.black, calHeightScale(55));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: (state is ButtonChanged)
                      ? ButtonText(
                          title: loc.main.continue_,
                          tapped: () => _nextPage(),
                          backgroundColor: state.backgroundColor,
                          textColor: state.textColor,
                          bottomMargin: state.bottomMargin,
                        )
                      : ButtonText(
                          title: loc.main.continue_,
                          tapped: () => _nextPage(),
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          bottomMargin: calHeightScale(44),
                        )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ));
  }

  void _nextPage() {}
}
