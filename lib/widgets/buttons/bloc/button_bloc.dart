import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial());

  @override
  Stream<ButtonState> mapEventToState(
    ButtonEvent event,
  ) async* {
    if (event is ChangeButton)
      yield ButtonChanged(
        backgroundColor: event.backgroundColor,
        textColor: event.textColor,
        bottomMargin: event.bottomMargin,
      );
    else if (event is ChangeIndexAndText)
      yield IndexAndTextChanged(index: event.index, text: event.text);
    else if (event is ChangeToggleButtonIndex)
      yield ToggleButtonIndexChanged(index: event.index, value: event.value);
    else if (event is ChangeSwitcher) yield SwitcherChanged(value: event.value);
  }
}
