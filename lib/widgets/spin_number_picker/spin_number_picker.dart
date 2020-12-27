import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../injection_container.dart';
import 'bloc/change_age_bloc.dart';

class SpinNumberPicker extends StatefulWidget {
  final int age;
  final Function(int) ageChanged;
  final Function(int) ageSelected;
  SpinNumberPicker(
      {Key key,
      @required this.age,
      @required this.ageChanged,
      @required this.ageSelected})
      : super(key: key);

  @override
  _SpinNumberPickerState createState() => _SpinNumberPickerState();
}

class _SpinNumberPickerState extends State<SpinNumberPicker> {
  int age;
  @override
  void initState() {
    age = widget.age;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChangeAgeBloc>(),
      child: BlocListener<ChangeAgeBloc, ChangeAgeState>(
        listener: (context, state) {
          if (state is AgeChanged) {
            widget.ageChanged(state.age);
            age = state.age;
          }
        },
        child: BlocBuilder<ChangeAgeBloc, ChangeAgeState>(
          builder: (context, state) {
            return Container(
              color: Colors.white,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print("YES");
                  widget.ageSelected(age);
                },
                child: NumberPicker.integer(
                    textStyle: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: calHeightScale(64),
                        fontWeight: FontWeight.w600,
                        color: AppTheme.middleGray),
                    selectedTextStyle:
                        Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: calHeightScale(64),
                              fontWeight: FontWeight.w600,
                            ),
                    itemExtent: calHeightScale(80),
                    initialValue: age,
                    minValue: 18,
                    maxValue: 125,
                    onChanged: (number) {
                      BlocProvider.of<ChangeAgeBloc>(context)
                          .add(ChangeAge(number));
                    }),
              ),
            );
          },
        ),
      ),
    );
  }
}
