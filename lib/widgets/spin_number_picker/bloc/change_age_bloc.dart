import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'change_age_event.dart';
part 'change_age_state.dart';

class ChangeAgeBloc extends Bloc<ChangeAgeEvent, ChangeAgeState> {
  ChangeAgeBloc() : super(ChangeAgeInitial());

  @override
  Stream<ChangeAgeState> mapEventToState(
    ChangeAgeEvent event,
  ) async* {
    if (event is ChangeAge) yield AgeChanged(event.age);
  }
}
