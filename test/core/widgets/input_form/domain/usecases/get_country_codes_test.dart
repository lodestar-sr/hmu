import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/usecases/usecase.dart';
import 'package:hmu/widgets/input_form/domain/entities/country_codes.dart';
import 'package:hmu/widgets/input_form/domain/repositories/input_form_repository.dart';
import 'package:hmu/widgets/input_form/domain/usecases/get_country_codes.dart';
import 'package:mockito/mockito.dart';

class MockInputFormRepository extends Mock implements InputFormRepository {}

void main() {
  MockInputFormRepository mockInputFormRepository;
  GetCountryCodes getCountryCodes;
  setUp(() {
    mockInputFormRepository = MockInputFormRepository();
    getCountryCodes = GetCountryCodes(repository: mockInputFormRepository);
  });

  test('Should return country codes from repository ', () async {
    final tCountryCodes = [CountryCodes()];
    when(mockInputFormRepository.getCountryCodes())
        .thenAnswer((_) async => Right(tCountryCodes));
    final result = await getCountryCodes(NoParams());
    expect(result, Right(tCountryCodes));
  });
}
