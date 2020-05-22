import 'package:covid_app/Utility/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/Utility/number_fromatting.dart';

import '../stat_row.dart';

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewConfirmed'] = this.newConfirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['TotalRecovered'] = this.totalRecovered;
    return data;
  }

  Widget getCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.blue,
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
                  "General information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimens.fontSecodnary,
                  ),
                ),
              ),
              StatRow("Total confirmed:", totalConfirmed.format(),
                  color: Colors.white),
              StatRow("Total recovered:", totalRecovered.format(),
                  color: Colors.white),
              Container(
                padding: EdgeInsets.only(
                  bottom: Dimens.smallDistance,
                ),
                child: StatRow("Total deaths:", totalDeaths.format(),
                    color: Colors.white),
              ),
              StatRow("New confirmed:", newConfirmed.format(),
                  color: Colors.white),
              StatRow("New recovered:", newRecovered.format(),
                  color: Colors.white),
              StatRow("New deaths:", newDeaths.format(), color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
