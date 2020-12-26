import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hmu/core/assets_address/json.dart';
import 'package:hmu/widgets/input_form/data/models/country_codes_model.dart';
import 'package:hmu/widgets/input_form/domain/entities/country_codes.dart';

abstract class InputFormLocalDataSource {
  Future<List<CountryCodes>> loadCountryCodes();
}

class InputFormLocalDataSourceImpl implements InputFormLocalDataSource {
  @override
  Future<List<CountryCodes>> loadCountryCodes() async {
    List<CountryCodesModel> countryLists = [];
    json.decode(await rootBundle.loadString(ProjectJsons.countryCodes)).forEach(
        (element) => countryLists.add(CountryCodesModel.fromJson(element)));
    return countryLists;
  }
}
