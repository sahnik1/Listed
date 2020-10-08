import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var closePrice = jsonResponse['2020-10-02 18:00:00']['4. close'];
    print('IBM\'s Close Price: $closePrice.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class StockView extends StatefulWidget {
  StockView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StockViewState createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {

  @override
  Widget build(BuildContext context) {

    var devicesize = MediaQuery.of(context).size;

    return null;
  }
}