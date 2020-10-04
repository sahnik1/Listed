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

    return Padding(
      padding: EdgeInsets.all(devicesize.width*0.04),
      child: ListView(
        children: [
          Container(
            width: devicesize.width*0.95,
            height: devicesize.height*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75)
                )
              ],
            ),
          ),
          SizedBox(
            height: devicesize.height*0.025,
          ),
          Container(
            width: devicesize.width*0.95,
            height: devicesize.height*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}