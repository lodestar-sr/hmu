import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/Routes/routes.dart';

import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_fab.dart';

import 'package:hmu/widgets/input_form/presentation/input_form.dart';
import 'package:hmu/widgets/spin_number_picker/spin_number_picker.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../injection_container.dart';
import '../../../main.dart';

class AgePage extends StatefulWidget {
  AgePage({Key key}) : super(key: key);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  bool openKeyboard = false;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<ButtonBloc>(),
        child: BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      buttonChanger(context, Colors.white, Colors.black,
                          calHeightScale(55));

                      openKeyboard = false;
                    },
                    child: ListView(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TopNavigation(
                          title: loc.main.how_old_are_you,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: calHeightScale(110)),
                          child: InputForm(
                            initalText: age.toString(),
                            placeHolder: "",
                            hint: loc.main.notice,
                            onChanged: (age) {},
                            maxLentgh: 3,
                            onFocused: (isFocused) {},
                            readOnly: true,
                            onTap: () {
                              buttonChanger(context, Colors.black, Colors.white,
                                  calHeightScale(30));
                              setState(() {
                                openKeyboard = true;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        ButtonFAB(
                            state: state,
                            nextPage: () {
                              Navigator.pushNamed(context, genderRoute);
                            }),
                        Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    calHeightScale((openKeyboard) ? 40 : 0)),
                            child: Visibility(
                                visible: openKeyboard,
                                child: SpinNumberPicker(
                                  age: age,
                                  ageChanged: (number) {
                                    age = number;
                                  },
                                  ageSelected: (number) {
                                    age = number;
                                    setState(() {
                                      openKeyboard = false;
                                    });
                                  },
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ));
  }
}
