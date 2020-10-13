import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
  //var symbolslist = <StockSearch>[];

  Future _doneFuture;

  var isfavouritebtn = false;

  _getSymbolsInit() async{
    var apiprovider = await StockSearchProvider();
    var symbolslist = await apiprovider.fetchSymbols();
    print('API was called!!');
    return symbolslist;
  }

  @override
  void initState() {
    //_getSymbolsInit();
    super.initState();
  }

  void favbtnstate() {
    setState(() {
      isfavouritebtn = !isfavouritebtn;
    });
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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0),
          itemCount: dataSnapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Color.fromRGBO(50, 54, 57, 1.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dataSnapshot.data[index].symbol,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          dataSnapshot.data[index].description,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(icon: Icon(Icons.star), onPressed: null),
                      ],
                    )
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