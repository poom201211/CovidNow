import 'dart:ui';

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
        title: Text(
          'CovidNow',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/isolation.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(120, 5, 120, 5),
                color: Colors.red[400],
                child: Text(
                  'Cases\n$confirmed\n[Increase $newConfirmed]',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                color: Colors.green,
                child: Text(
                  'Recovered\n$recovered\n[Increase $newRecovered]',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                color: Colors.blueGrey,
                child: Text(
                  'Deaths\n$deaths\n[Increase $newDeaths]',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 133,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 5, 15, 5),
                color: Colors.lightBlue,
                child: Text(
                  'Hospitalized\n$hospitalized\n[Changes $newHospitalized]',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
          'Post',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.red[400],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red[400],
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.grey[200],
    );
  }
}
