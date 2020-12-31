import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottombar_provider_event.dart';
part 'bottombar_provider_state.dart';

class BottombarProviderBloc
    extends Bloc<BottombarProviderEvent, BottombarProviderState> {
  BottombarProviderBloc() : super(BottombarProviderInitial());

  @override
  Stream<BottombarProviderState> mapEventToState(
    BottombarProviderEvent event,
  ) async* {
    if (event is ChangeBottomBarIndex)
      yield BottombarIndexChanged(index: event.index);
  }
}
