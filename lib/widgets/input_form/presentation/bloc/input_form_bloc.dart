import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hmu/usecases/usecase.dart';
import 'package:hmu/widgets/input_form/domain/entities/country_codes.dart';
import 'package:hmu/widgets/input_form/domain/usecases/get_country_codes.dart';

part 'input_form_event.dart';
part 'input_form_state.dart';

class InputFormBloc extends Bloc<InputFormEvent, InputFormState> {
  final GetCountryCodes getCountryCodes;
  InputFormBloc({@required this.getCountryCodes}) : super(InputFormInitial());

  @override
  Stream<InputFormState> mapEventToState(
    InputFormEvent event,
  ) async* {
    if (event is LoadCountriesEvenet) {
      final result = await getCountryCodes(NoParams());
      yield result.fold((failure) => CountriesCodeLoadError(),
          (codes) => CountriesCodeLoadedState(countryCodes: codes));
    }
  }
}
