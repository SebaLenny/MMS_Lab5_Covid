import 'package:covid_app/Models/country.dart';
import 'package:covid_app/Models/global.dart';

class CovidStatistics {
  Global global;
  List<Country> countries;
  DateTime date;

  CovidStatistics({this.global, this.countries, this.date});

  CovidStatistics.fromJson(Map<String, dynamic> json) {
    global =
        json['Global'] != null ? new Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = new List<Country>();
      json['Countries'].forEach((v) {
        countries.add(new Country.fromJson(v));
      });
    }
    date = DateTime.parse(json['Date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.global != null) {
      data['Global'] = this.global.toJson();
    }
    if (this.countries != null) {
      data['Countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    data['Date'] = this.date.toString();
    return data;
  }
}
