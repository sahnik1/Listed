import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {
  Watchlist({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WatchlistState createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    var devicesize = MediaQuery.of(context).size;

    return null;
  }
}