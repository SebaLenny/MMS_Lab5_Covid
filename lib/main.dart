import 'package:covid_app/Models/covid_statistics.dart';
import 'package:covid_app/Utility/dimens.dart';
import 'package:covid_app/Utility/strings.dart';
import 'package:covid_app/data_handler.dart';
import 'package:flutter/material.dart';

import 'menu_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.mainTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Covid App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<CovidStatistics> futureCovidStatistics;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureCovidStatistics = DataHandler.provideNewestAvaliableData();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
          child: FutureBuilder<CovidStatistics>(
        future: futureCovidStatistics,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                snapshot.data.getWidget(editingController, refresh)
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }
}
