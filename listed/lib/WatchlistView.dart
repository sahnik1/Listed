import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class WatchlistView extends StatelessWidget{

  Future<List<Stock>> _getStocks () async {
    var data = await http.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo");
    if (data.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(data.body);
      var closePrice = jsonResponse['Time Series (5min)']['2020-10-02 18:00:00']['4. close'];
      print('IBM\'s Close Price: $closePrice.');
    } else {
      print('Request failed with status: ${data.statusCode}.');
    }
  }

  List<String> stocks = ["AAPL", "TSLA", "BABA", "OXY", "PDD"];

  List<double> stockspri = [126.99, 450.23, 298.34, 11.23, 78.91];

  final cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 8,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
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
                      fontWeight: FontWeight.bold
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
                            color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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
                          fontWeight: FontWeight.bold
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
                          color: Colors.grey
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

    return Scrollbar(
      child: ListView.builder(
          padding: EdgeInsets.only(left: devicesize.width*0.04, top: 15, right: devicesize.width*0.04, bottom: devicesize.height/11),
          itemCount: stockslist.length,
          itemBuilder: (context, index) {
            return stockslist[index];
          },
        ),
    );
  }
}

class Stock {
  String symbol;
  double yearlow;
  double yearhigh;
  double price;
  double prevclose;
  double change;
  String changepercent;
  double volume;

  Stock(this.symbol, this.yearlow, this.yearhigh, this.price, this.prevclose, this.change, this.changepercent, this.volume);

}