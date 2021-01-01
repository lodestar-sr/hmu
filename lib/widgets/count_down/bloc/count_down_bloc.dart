import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'count_down_event.dart';
part 'count_down_state.dart';

class CountDownBloc extends Bloc<CountDownEvent, CountDownState> {
  CountDownBloc() : super(CountDownInitial());

  @override
  Stream<CountDownState> mapEventToState(
    CountDownEvent event,
  ) async* {
    if (event is StartCountDown)
      yield CountDownStarted();
    else if (event is ChangeCountDown)
      yield CountDownChanged(seconds: event.seconds);
  }
}
