import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class WatchlistView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;

    var stockslist = <Widget>[
      Card(
        child: Container(
          width: devicesize.width,
          height: devicesize.height*0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white,

          ),
        ),
      ),
      SizedBox(
        height: devicesize.height*0.025,
      ),
    ];

    return ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: stockslist.length,
        itemBuilder: (context, index) {
          return stockslist[index];
        },
      );
  }
}