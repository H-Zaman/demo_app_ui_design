import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testa/config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  MyAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: Color(0xff00CCCC),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: SizeConfig.appBarTitle,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.more_vert,
            size: SizeConfig.appBarIcon * 1.3,
            color: Color(0xff727C8E),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => SizeConfig.appBarSize;
}