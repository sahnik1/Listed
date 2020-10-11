import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:listed/db_helper_StockSearch.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class StockSearch {
  String symbol;
  String fullname;
  String isetf;
  String exch;

  StockSearch(this.symbol, this.fullname, this.isetf, this.exch);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'symbol': symbol,
      'fullname': fullname,
      'isetf' : isetf,
      'exch' : exch
    };
    return map;
  }

  StockSearch.fromMap(Map<String, dynamic> map){
    symbol = map['symbol'];
    fullname = map['fullname'];
    isetf = map['isetf'];
    exch = map['exch'];
  }

  factory StockSearch.fromJson(Map<String, dynamic> json) {
    return StockSearch(
      json['ticker'],
      json['name'],
      json['is_etf'],
      json['exchange'],
    );
  }
}

class StockSearchProvider {
  Future<List<StockSearch>> fetchSymbols() async {
    final response = await http.get('https://dumbstockapi.com/stock?format=json&countries=US');

    if (response.statusCode == 200) {
      print(response.body);
      return (response.body as List).map((stockobject) {
        print('Inserting $stockobject');
        DBHelperStockSearch.dbinstance.addStockSearch(StockSearch.fromJson(stockobject));
      }).toList();
    } else {
      throw Exception('Failed to load Symbols');
    }
  }
}