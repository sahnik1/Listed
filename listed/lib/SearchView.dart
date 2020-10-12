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
  //var symbolslist = <StockSearch>[];

  Future _doneFuture;

  _getSymbolsInit() async{
    var apiprovider = await StockSearchProvider();
    var symbolslist = await apiprovider.fetchSymbols();
    return symbolslist;
  }

  @override
  void initState() {
    //_getSymbolsInit();
    super.initState();
  }

  _buildSearchListView() {
    return FutureBuilder(
      future: _getSymbolsInit(),
      builder: (context, dataSnapshot) {
        if (!dataSnapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: dataSnapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dataSnapshot.data[index].symbol,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      dataSnapshot.data[index].description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSearchListView(),
    );
  }
}