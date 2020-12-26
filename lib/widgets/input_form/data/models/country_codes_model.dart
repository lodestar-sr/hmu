import 'package:hmu/widgets/input_form/domain/entities/country_codes.dart';

class CountryCodesModel extends CountryCodes {
  CountryCodesModel(
      {String iso2,
      String name,
      String iso3,
      String unicode,
      String dial,
      String currency,
      String capital,
      String continent})
      : super(
            capital: capital,
            name: name,
            iso2: iso2,
            iso3: iso3,
            unicode: unicode,
            continent: continent,
            currency: currency,
            dial: dial);

  factory CountryCodesModel.fromJson(Map<String, dynamic> json) {
    return CountryCodesModel(
      name: json['Name'],
      iso3: json['Iso3'],
      unicode: json['Unicode'],
      dial: json['Dial'],
      currency: json['Currency'],
      capital: json['Capital'],
      continent: json['Continent'],
      iso2: json['Iso2'],
    );
  }
}
