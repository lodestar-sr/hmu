import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';

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
                      openKeyboard = false;
                      buttonChanger(context, Colors.white, Colors.black,
                          calHeightScale(55));
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
                            hint: loc.main.age_notice,
                            onChanged: (age) {},
                            maxLentgh: 3,
                            onFocused: (isFocused) {},
                            readOnly: true,
                            onTap: () {
                              openKeyboard = true;
                              buttonChanger(context, Colors.black, Colors.white,
                                  calHeightScale(123));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: Container(
                  margin: EdgeInsets.only(bottom: calHeightScale(40)),
                  child: Visibility(
                      visible: openKeyboard,
                      child: SpinNumberPicker(
                        age: 18,
                        ageChanged: (number) {
                          age = number;
                        },
                        ageSelected: (number) {
                          age = number;
                          openKeyboard = false;
                        },
                      ))),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ));
  }
}
