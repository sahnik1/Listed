import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Stock.dart';


class WatchlistView extends StatelessWidget{

  List<String> stocks = ["AAPL", "TSLA", "BABA", "OXY", "PDD"];

  List<double> stockspri = [126.99, 450.23, 298.34, 11.23, 78.91];

  final cardDecoration = BoxDecoration(
    color: Color.fromRGBO(50, 54, 57, 1.0),
    borderRadius: BorderRadius.circular(30),
  );

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;


    var stockslist = <Widget>[
      InkWell(
        child: Container(
          padding: EdgeInsets.all(8),
          width: devicesize.width*0.95,
          height: devicesize.height/5,
          decoration: cardDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: devicesize.width/20, top: devicesize.height*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(stocks[0],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: devicesize.width/20, bottom: devicesize.height*0.02),
                      child: Text("Apple Inc.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white60
                        ),
                      ),
                    ),
                  ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: devicesize.height*0.025,
      ),
    ];

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent
      ),
      child: ScrollConfiguration(
        behavior: new ScrollBehavior()..buildViewportChrome(context, null, AxisDirection.down),
        child: Scrollbar(
          child: ListView.builder(
              physics: const ScrollPhysics(),
              padding: EdgeInsets.only(left: devicesize.width*0.04, top: 15, right: devicesize.width*0.04, bottom: devicesize.height/11),
              itemCount: stockslist.length,
              itemBuilder: (context, index) {
                return stockslist[index];
              },
            ),
        ),
      ),
    );
  }
}