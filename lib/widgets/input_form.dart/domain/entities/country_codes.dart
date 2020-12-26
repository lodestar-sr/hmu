import 'package:equatable/equatable.dart';

class CountryCodes extends Equatable {
  final String iso2;
  final String name;
  final String iso3;
  final String unicode;
  final String dial;
  final String currency;
  final String capital;
  final String continent;

  CountryCodes(
      {this.iso2,
      this.name,
      this.iso3,
      this.unicode,
      this.dial,
      this.currency,
      this.capital,
      this.continent});

  @override
  List<Object> get props => [dial];
}
