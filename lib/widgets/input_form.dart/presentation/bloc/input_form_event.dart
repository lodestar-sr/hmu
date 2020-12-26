part of 'input_form_bloc.dart';

abstract class InputFormEvent extends Equatable {
  const InputFormEvent();

  @override
  List<Object> get props => [];
}

class LoadCountriesEvenet extends InputFormEvent {}
