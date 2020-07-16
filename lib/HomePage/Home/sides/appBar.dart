import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testa/config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  MyAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return AppBar(
      backgroundColor: Color(0xff00CCCC),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: SizeConfig.appBarTitle,
        ),
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            size: SizeConfig.appBarIcon,
          ),
          onSelected: (value){},
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
                    fontSize: height * 1.8
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'amount',
              child: Text(
                'by Amount',
                style: TextStyle(
                    fontSize: height * 1.8
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'ascending',
              child: Text(
                'by Ascending',
                style: TextStyle(
                    fontSize: height * 1.8
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'descending',
              child: Text(
                'by Descending',
                style: TextStyle(
                    fontSize: height * 1.8
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => SizeConfig.appBarSize;
}