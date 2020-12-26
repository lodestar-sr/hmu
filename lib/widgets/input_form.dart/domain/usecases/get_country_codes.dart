import 'package:flutter/foundation.dart';
import 'package:hmu/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hmu/usecases/usecase.dart';
import 'package:hmu/widgets/input_form.dart/domain/entities/country_codes.dart';
import 'package:hmu/widgets/input_form.dart/domain/repositories/input_form_repository.dart';

class GetCountryCodes implements UseCase<List<CountryCodes>, NoParams> {
  final InputFormRepository repository;
  GetCountryCodes({@required this.repository});
  @override
  Future<Either<Failure, List<CountryCodes>>> call(NoParams param) {
    return repository.getCountryCodes();
  }
}
