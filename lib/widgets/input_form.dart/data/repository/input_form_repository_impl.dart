import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:hmu/core/error/failures.dart';
import 'package:hmu/widgets/input_form.dart/data/datasources/input_form_local_data_source.dart';
import 'package:hmu/widgets/input_form.dart/domain/entities/country_codes.dart';
import 'package:hmu/widgets/input_form.dart/domain/repositories/input_form_repository.dart';

class InputFormRepositoryImpl implements InputFormRepository {
  final InputFormLocalDataSource localDataSource;
  InputFormRepositoryImpl({@required this.localDataSource});
  @override
  Future<Either<Failure, List<CountryCodes>>> getCountryCodes() async {
    try {
      final countryCodes = await localDataSource.loadCountryCodes();
      return Right(countryCodes);
    } catch (e) {
      print(e);
      return Left(CountryCodesFailure());
    }
  }
}
