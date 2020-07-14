import 'package:flutter/material.dart';
import 'package:testa/HomePage/Home/sides/drawer.dart';
import 'package:testa/config.dart';

class ReportHome extends StatefulWidget {
  @override
  _ReportHomeState createState() => _ReportHomeState();
}

class _ReportHomeState extends State<ReportHome> {

  String _text = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: SizeConfig.appBarSize,
        child: AppBar(
          backgroundColor: Color(0xff00CCCC),
          title: Text(
            'Report',
            style: TextStyle(
              fontSize: SizeConfig.appBarTitle,
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                size: SizeConfig.appBarIcon,
              ),
              onSelected: (value){
                setState(() {
                  _text = value;
                });
              },
              padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  enabled: false,
                  child: Container(
                    height: height * 5,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.sort,
                          size: SizeConfig.appBarIcon * .7,
                          color: Colors.black,
                        ),
                        SizedBox(width: width,),
                        Text(
                          'Sort BY',
                          style: TextStyle(
                            fontSize: height * 2
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'date',
                  child: Text(
                    'by Date',
                    style: TextStyle(
                      fontSize: height * 2
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'amount',
                  child: Text(
                    'by Amount',
                    style: TextStyle(
                        fontSize: height * 2
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'ascending',
                  child: Text(
                    'by Ascending',
                    style: TextStyle(
                        fontSize: height * 2
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'descending',
                  child: Text(
                    'by Descending',
                    style: TextStyle(
                        fontSize: height * 2
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: MyDrawer(userName: 'Annie',),
      body: Text(
        _text,
        style: TextStyle(
          fontSize: 30,
          color: Colors.red
        ),
      ),
    );
  }
}
