import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var devicesize = MediaQuery.of(context).size;

    var topBar = AppBar(
        backgroundColor: Color.fromRGBO(60,64,198,1.0),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('My Watchlist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
          ),
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
                    color: Colors.white,
                ),
                onPressed: null
            ),
          ),
        ],
    );

    var navBar = BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Color.fromRGBO(60,64,198,1.0),
        //Color.fromRGBO(47,53,66,1.0),
        unselectedItemColor: Colors.white,
        //Color.fromRGBO(206,214,224,1.0),
        selectedItemColor: Color.fromRGBO(255,168,1,1.0),
        //Color.fromRGBO(72,219,251,1.0),
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartArea),
              label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
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
          extendBodyBehindAppBar: true,
          appBar: topBar,
          backgroundColor: Color.fromRGBO(72,84,96,1.0),
          bottomNavigationBar: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  child: navBar,
              ),
          ),
        ),
    );
  }
}
