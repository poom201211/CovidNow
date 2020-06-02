import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  int confirmed;
  int newConfirmed;
  int recovered;
  int newRecovered;
  int hospitalized;
  int newHospitalized;
  int deaths;
  int newDeaths;

  Future getData() async {
    http.Response response =
        await http.get("https://covid19.th-stat.com/api/open/today");
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      confirmed = data["Confirmed"];
      newConfirmed = data["NewConfirmed"];
      recovered = data["Recovered"];
      newRecovered = data["NewRecovered"];
      hospitalized = data["Hospitalized"];
      newHospitalized = data["NewHospitalized"];
      deaths = data["Deaths"];
      newDeaths = data["NewDeaths"];
    });
    debugPrint(newConfirmed.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CovidNow'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/covid.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(120, 5, 120, 5),
              color: Colors.red[600],
              child: Text(
                'Cases\n$confirmed\n[Increase $newConfirmed]',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              color: Colors.green,
              child: Text(
                'Recovered\n$recovered\n[Increase $newRecovered]',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              color: Colors.blueGrey,
              child: Text(
                'Deaths\n$deaths\n[Increase $newDeaths]',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 138,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              color: Colors.lightBlue,
              child: Text(
                'Hospitalized\n$hospitalized\n[Changes $newHospitalized]',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Post'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
