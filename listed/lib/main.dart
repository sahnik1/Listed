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
import 'package:listed/SearchView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _viewList = [
      WatchlistView(),
      Container(color: Colors.blue),
      SearchView(),
      Container(color: Colors.blue),
  ];

  var _currIndex = 0;

  void _tapChangeView (int index) {
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var devicesize = MediaQuery.of(context).size;

    var topBar = AppBar(
        backgroundColor: Colors.black87,
        //Color.fromRGBO(50, 54, 57, 1),
        //Color.fromRGBO(138, 63, 216, 1.0),
        shadowColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('List',
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
          ),
        ),
        titleSpacing: 5,
    );

    var navBar = BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _tapChangeView,
        currentIndex: _currIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25,
        backgroundColor: Colors.black87,
        //Color.fromRGBO(50, 54, 57, 1.0),
        //Color.fromRGBO(47,53,66,1.0),
        unselectedItemColor: Colors.white,
        //Color.fromRGBO(206,214,224,1.0),
        selectedItemColor: Colors.deepPurpleAccent,
        //Color.fromRGBO(72,219,251,1.0),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidNewspaper),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: "Settings"
          )
        ],
    );

    return DefaultTabController(length: 4,
          child: Scaffold(
            extendBodyBehindAppBar: false,
            appBar: topBar,
            backgroundColor: Colors.black87,
            bottomNavigationBar: Theme(
              child: navBar,
              data: ThemeData(
                splashColor: Colors.transparent,
              ),
            ),
            body: _viewList[_currIndex],
          ),
    );
  }
}
