import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  int _current = 0;

  List imgList = [
    'assets/facts1.jpg',
    'assets/facts2.jpg',
    'assets/facts3.jpg',
    'assets/facts4.jpg',
    'assets/facts5.jpg',
    'assets/facts6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID FACTS',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          //Moving covid facts
          Positioned(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CarouselSlider(
                      items: imgList.map((i) {
                        return Builder(
                          builder: (BuildContext context){
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              child: Image.asset(i),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 300.0,
                        initialPage: 0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
