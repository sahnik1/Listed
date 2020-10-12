import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:listed/Stock.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBHelperStockSearch {
  static Database _db;
  static const String SYMBOL = 'symbol';
  static const String CURRENCY = 'currency';
  static const String DESC = 'description';
  static const String TYPE = 'type';
  static const String SearchTABLE = 'StockSymbols';
  static const String DB_NAME = 'stocks.db';

  static final dbinstance = DBHelperStockSearch._();
  DBHelperStockSearch._();

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    else{
      _db = await initDB();
      return _db;
    }
  }

  initDB() async {
    io.Directory docsdirectory = await getApplicationDocumentsDirectory();
    String path = join(docsdirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $SearchTABLE ($SYMBOL TEXT PRIMARY KEY, $CURRENCY TEXT, $DESC TEXT, $TYPE TEXT)");
  }

  addStockSearch(StockSearch searchobject) async {
    var dbClient = await db;
    var res = await dbClient.insert(SearchTABLE, searchobject.toMap());
    return res;
  }

  Future<List<StockSearch>> getAllStocks() async {

    final dbClient = await db;
    final res = await dbClient.rawQuery("SELECT * FROM $SearchTABLE");

    List<StockSearch> list = res.isNotEmpty ? res.map((c) => StockSearch.fromJson(c)).toList() : [];
    return list;
  }
}