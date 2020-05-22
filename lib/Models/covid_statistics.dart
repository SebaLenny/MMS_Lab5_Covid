import 'package:covid_app/Models/country.dart';
import 'package:covid_app/Models/global.dart';
import 'package:covid_app/Utility/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CovidStatistics {
  Global global;
  List<Country> countries;
  List<Country> countriesFiltered;
  DateTime date;

  String get lastUpdate {
    return timeago.format(date);
  }

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
    countriesFiltered = countries;
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

  void _applyFilter(String filter) {
    List<Country> list = List<Country>();
    for (var country in countries) {
      if (country.country.toLowerCase().contains(filter.toLowerCase())) {
        list.add(country);
      }
      countriesFiltered = list;
    }
  }

  Widget getWidget(TextEditingController editingController, Function refresh) {
    List<Widget> list = List<Widget>();
    list.add(global.getCard());
    list.add(
      Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            Dimens.standardDistance,
          ),
          child: Text("Data fetched from $lastUpdate"),
        ),
      ),
    );
    list.add(
      Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            Dimens.standardDistance,
          ),
          child: TextField(
            onChanged: (value) {
              _applyFilter(value);
              refresh();
            },
            controller: editingController,
            decoration: InputDecoration(
              labelText: "Find country",
              hintText: "Find country",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
    for (var country in countriesFiltered) {
      list.add(country.getCard());
    }

    return Column(
      children: list,
    );
  }
}
