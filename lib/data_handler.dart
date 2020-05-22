import 'dart:convert';

import 'package:covid_app/Models/covid_statistics.dart';
import 'package:covid_app/request_handler.dart';
import 'package:covid_app/storage_handler.dart';

class DataHandler {
  static Future<CovidStatistics> provideNewestAvaliableData() async {
    // String data = await RequestHandler.fetchFreshData();
    String data = ""; // TODO: For final release use API
    if (data.isNotEmpty) {
      await StorageHandler.writeStorage(data);
      return CovidStatistics.fromJson(json.decode(data));
    } else {
      data = await StorageHandler.readStorage();
      if (data.isNotEmpty) {
        return CovidStatistics.fromJson(json.decode(data));
      }
    }
    data = await StorageHandler.loadBaseSource();
    if(data.isEmpty){
      throw Exception('Could not load data from any source');
    }
    return CovidStatistics.fromJson(json.decode(data));
  }
}
