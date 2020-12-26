import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/core/error/failures.dart';
import 'package:hmu/widgets/input_form.dart/domain/entities/country_codes.dart';
import 'package:hmu/widgets/input_form.dart/domain/usecases/get_country_codes.dart';
import 'package:hmu/widgets/input_form.dart/presentation/bloc/input_form_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetCountriesCode extends Mock implements GetCountryCodes {}

void main() {
  MockGetCountriesCode mockGetCountriesCode;
  InputFormBloc bloc;
  setUp(() {
    mockGetCountriesCode = MockGetCountriesCode();
    bloc = InputFormBloc(getCountryCodes: mockGetCountriesCode);
  });

  test('Should return countriesCodeLoadedState', () async {
    final tCountryCodesList = [CountryCodes()];
    when(mockGetCountriesCode(any))
        .thenAnswer((_) async => Right(tCountryCodesList));
    final expected = [
      InputFormInitial(),
      CountriesCodeLoadedState(countryCodes: tCountryCodesList)
    ];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(LoadCountriesEvenet());
  });

  test('Should return CountriesCodeLoadError', () async {
    when(mockGetCountriesCode(any))
        .thenAnswer((_) async => Left(CountryCodesFailure()));
    final expected = [
      InputFormInitial(),
      CountriesCodeLoadError(),
    ];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(LoadCountriesEvenet());
  });
}
