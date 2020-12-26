import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/widgets/input_form.dart/data/models/country_codes_model.dart';
import 'package:hmu/widgets/input_form.dart/domain/entities/country_codes.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  test('Should return subclass of CountryCodes', () {
    final tCountryCodesModal = CountryCodesModel();
    expect(tCountryCodesModal, isA<CountryCodes>());
  });
  test('Should return CountryCodesModel from json file', () async {
    List<CountryCodesModel> countryLists = [];
    json.decode(fixture("signup", "country_codes.json")).forEach(
        (element) => countryLists.add(CountryCodesModel.fromJson(element)));

    final bangeladesh = CountryCodesModel(
        iso2: "BD",
        name: "Bangladesh",
        iso3: "BGD",
        unicode: "bangladesh",
        dial: "880",
        currency: "880",
        capital: "Dhaka",
        continent: "AS");
    final belgium = CountryCodesModel(
        iso2: "BE",
        name: "Belgium",
        iso3: "BEL",
        unicode: "belgium",
        dial: "32",
        currency: "EUR",
        capital: "Brussels",
        continent: "EU");
    expect([bangeladesh, belgium], countryLists);
  });
}
