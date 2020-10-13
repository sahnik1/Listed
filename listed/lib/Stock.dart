import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:listed/db_helper_StockSearch.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:listed/api_details.dart';


class StockSearch {
  String symbol;
  String currency;
  String description;
  String type;

  StockSearch(this.symbol, this.currency, this.description, this.type);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'symbol': symbol,
      'currency': currency,
      'description' : description,
      'type' : type,
    };
    return map;
  }

  StockSearch.fromMap(Map<String, dynamic> map){
    symbol = map['symbol'];
    currency = map['currency'];
    description = map['description'];
    type = map['type'];
  }

  factory StockSearch.fromJson(Map<String, dynamic> json) {
    return StockSearch(
      json['symbol'],
      json['currency'],
      json['description'],
      json['type'],
    );
  }

}

class StockSearchProvider {
  Future<List<StockSearch>> fetchSymbols() async {
    final response = await http.get('https://finnhub.io/api/v1/stock/symbol?exchange=US&token=$api_key');

    if (response.statusCode == 200) {
      //print(convert.jsonDecode(response.body).toString());
      var parsed = convert.jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<StockSearch>((json) => StockSearch.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Symbols');
    }
  }
}