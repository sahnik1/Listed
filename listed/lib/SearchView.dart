import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'WatchlistView.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:listed/Stock.dart';
import 'package:listed/db_helper_StockSearch.dart';

class SearchView extends StatefulWidget {
  SearchView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView>{
  var isLoading = false;
  var dbstuff = DBHelperStockSearch.dbinstance;

  Future _doneFuture;

  _getSymbolsInit() async{
    await dbstuff.initDB();
    var apiprovider = StockSearchProvider();
    await apiprovider.fetchSymbols();
  }

  @override
  void initState() {
    _doneFuture = _getSymbolsInit();
    super.initState();
  }

  _buildSearchListView() {
    return FutureBuilder(
      future: dbstuff.getAllStocks(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot);
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 20.0),
                ),
                title: Text(
                    "Name: ${snapshot.data[index].firstName} ${snapshot.data[index].lastName} "),
                subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
              );
            },
          );
        }
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSearchListView(),
    );
  }
}