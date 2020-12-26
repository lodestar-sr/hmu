import 'package:dartz/dartz.dart';
import 'package:hmu/core/error/failures.dart';
import 'package:hmu/widgets/input_form.dart/domain/entities/country_codes.dart';

abstract class InputFormRepository {
  Future<Either<Failure, List<CountryCodes>>> getCountryCodes();
}
