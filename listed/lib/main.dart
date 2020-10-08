import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'WatchlistView.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*void main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var closePrice = jsonResponse['Time Series (5min)']['2020-10-02 18:00:00']['4. close'];
    print('IBM\'s Close Price: $closePrice.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listed',
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
      Container(color: Colors.red),
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
        backgroundColor: Color.fromRGBO(138, 63, 216, 1.0),
        shadowColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('My Watchlist',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            )
          ),
        ),
        titleSpacing: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                    Icons.search_outlined,
                    size: 35,
                    color: Colors.black,
                ),
                onPressed: null
            ),
          ),
        ],
    );

    var navBar = BottomNavigationBar(
        onTap: _tapChangeView,
        currentIndex: _currIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Colors.white,
        //Color.fromRGBO(47,53,66,1.0),
        unselectedItemColor: Colors.black38,
        //Color.fromRGBO(206,214,224,1.0),
        selectedItemColor: Colors.black,
        //Color.fromRGBO(72,219,251,1.0),
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.listUl),
              label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartArea),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: "Settings"
          )
        ],
    );

    return DefaultTabController(length: 3,
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: false,
            appBar: topBar,
            backgroundColor: Color.fromRGBO(116, 185, 255,1.0),
            //Color.fromRGBO(240, 245, 255, 1.0),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      child: Theme(
                          child: navBar,
                          data: ThemeData(
                            splashColor: Colors.transparent
                          ),
                      ),
                  ),
            ),
            body: _viewList[_currIndex],
          ),
    );
  }
}
