import 'package:flutter/material.dart';
import 'package:testa/HomePage/Home/sides/drawer.dart';
import 'package:testa/config.dart';

class ERROR404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00CCCC),
        title: Text(
          'ERROR 404',
          style: TextStyle(
            fontSize: SizeConfig.appBarTitle * 1.2
          ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(userName: 'Annie',),
      body: Center(
        child: Text(
          'PAGE DOES NOT EXIST',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff00CCCC)
          ),
        ),
      ),
    );
  }
}
