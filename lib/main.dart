import 'package:flutter/material.dart';

import 'HomePage/Home/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Color(0xff00CCCC),
        highlightColor: Color(0xffBFBFBF),
        accentColor: Color(0xff00CCCC),
        fontFamily: 'Popins',
      ),
      home: MyHomePage(),
    );
  }
}









