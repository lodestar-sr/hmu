import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/core/error/failures.dart';
import 'package:hmu/widgets/input_form/data/datasources/input_form_local_data_source.dart';
import 'package:hmu/widgets/input_form/data/repository/input_form_repository_impl.dart';
import 'package:hmu/widgets/input_form/domain/entities/country_codes.dart';
import 'package:mockito/mockito.dart';

class MockInputFormLocalDataSource extends Mock
    implements InputFormLocalDataSource {}

void main() {
  MockInputFormLocalDataSource mockInputFormLocalDataSource;
  InputFormRepositoryImpl impl;

  setUp(() {
    mockInputFormLocalDataSource = MockInputFormLocalDataSource();
    impl =
        InputFormRepositoryImpl(localDataSource: mockInputFormLocalDataSource);
  });

  test('should return countries List', () async {
    final tCountriesList = [CountryCodes()];
    when(mockInputFormLocalDataSource.loadCountryCodes())
        .thenAnswer((_) async => tCountriesList);
    final result = await impl.getCountryCodes();
    expect(result, Right(tCountriesList));
  });

  test('Should return CountryCodesFailure', () async {
    when(mockInputFormLocalDataSource.loadCountryCodes())
        .thenThrow(Exception());
    final result = await impl.getCountryCodes();
    expect(result, Left(CountryCodesFailure()));
  });
}
