import 'package:covid_app/Utility/dimens.dart';
import 'package:covid_app/Utility/number_fromatting.dart';
import 'package:covid_app/stat_row.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Country {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;

  String get lastUpdate {
    return timeago.format(date);
  }

  Country(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  Country.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = DateTime.parse(json['Date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Slug'] = this.slug;
    data['NewConfirmed'] = this.newConfirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['TotalRecovered'] = this.totalRecovered;
    data['Date'] = this.date.toString();
    return data;
  }

  Widget getCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(
            Dimens.standardDistance,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  bottom: Dimens.smallDistance,
                ),
                child: Text(
                  country,
                  style: TextStyle(
                    fontSize: Dimens.fontSecodnary,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: Dimens.smallDistance,
                ),
                child: Text(
                  "Data fetched from $lastUpdate",
                ),
              ),
              StatRow("Total confirmed:", totalConfirmed.format()),
              StatRow("Total recovered:", totalRecovered.format()),
              Container(
                padding: EdgeInsets.only(
                  bottom: Dimens.smallDistance,
                ),
                child: StatRow("Total deaths:", totalDeaths.format()),
              ),
              StatRow("New confirmed:", newConfirmed.format()),
              StatRow("New recovered:", newRecovered.format()),
              StatRow("New deaths:", newDeaths.format()),
            ],
          ),
        ),
      ),
    );
  }
}
