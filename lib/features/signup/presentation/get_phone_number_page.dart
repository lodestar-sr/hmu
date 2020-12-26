import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_fab.dart';
import 'package:hmu/widgets/input_form.dart/presentation/input_form.dart';
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
  String countryCode = "";
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
                    child: ListView(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TopNavigation(),
                        SizedBox(height: calHeightScale(186)),
                        InputForm(
                          placeHolder: loc.main.phone_number,
                          hint: loc.main.enter_your_phone_number,
                          maxLentgh: 11,
                          haveAreaCode: true,
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
                          countryCodeOnChanged: (code) {
                            countryCode = code;
                          },
                          countryCodeSuggestionSelected: (code) {
                            countryCode = code;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton:
                  ButtonFAB(state: state, nextPage: _nextPage),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ));
  }

  void _nextPage() {
    Navigator.pushNamed(context, verifyCodeRoute, arguments: widget.isLogin);
  }
}
