part of 'input_form_bloc.dart';

abstract class InputFormState extends Equatable {
  const InputFormState();

  @override
  List<Object> get props => [];
}

class InputFormInitial extends InputFormState {}

class CountriesCodeLoadedState extends InputFormState {
  final List<CountryCodes> countryCodes;
  CountriesCodeLoadedState({@required this.countryCodes});
}

class CountriesCodeLoadError extends InputFormState {}
