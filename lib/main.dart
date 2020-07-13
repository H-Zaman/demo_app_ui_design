import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testa/config.dart';

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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  String userName = 'Annie';
  String totalSale = '123, 456, 789';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(userName: userName,),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 4
          ),
          padding: EdgeInsets.only(
            top: height * 3
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //-----------------------------------------------top cards
                Container(
                  height: height * 25,
                  child: Column(
                    children: <Widget>[
                      //---------------------------------card 1 card 2
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            //----------------------card 1
                            Expanded(
                              child: Card(
                                elevation: 2.0,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(111111)
                                    ),
                                    elevation: 3.0,
                                    child: Container(
                                      width: width * 10,
                                      height: width * 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.monetization_on,
                                          size: height * 4.5,
                                          color: Color(0xff8BABEB),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    'Total Sale',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: height * 1.8,
                                      )
                                    ),
                                  ),
                                  subtitle: Text(
                                    '\$ ' + totalSale,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: height * 1.8,
                                        color: Colors.grey
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                elevation: 3.0,
                                child: Container(
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //---------------------------------card 3 card 4
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Card(
                                elevation: 3.0,
                                child: Container(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                elevation: 3.0,
                                child: Container(
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends Drawer {
  final String userName;
  const MyDrawer({this.userName});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;

    drawerButton(IconData icon, String string) {
      return Container(
        height: height * 7,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: width * .1
            )
          )
        ),
        child: FlatButton(
          onPressed: (){},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: width*2,),
              //----------------------------------------------main icon
              Icon(
                icon,
                size: SizeConfig.appBarIcon,
                color: Colors.black,
              ),
              SizedBox(width: width*2,),
              //----------------------------------------------title
              Text(
                string,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: SizeConfig.appBarTitle * .9
                  )
                ),
              ),
              Spacer(),
              //----------------------------------------------next icon
              Icon(
                Icons.arrow_forward_ios,
                size: SizeConfig.appBarIcon*.6,
                color: Colors.black,
              )
            ],
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //-----------------------------------------------drawer top part
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff000cccc)
            ),
            child: Container(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'asset/profile-Picture.jpg'
                    ),
                    radius: width * 10,
                  ),
                  SizedBox(width: width * 2,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hi ' + userName + ',',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: height * 3,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(width*.3,height*.3),
                                blurRadius: 15.0,
                                color: Colors.black.withOpacity(0.5),
                              )
                            ]
                          )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print('Drawer =>  Get all Updates');
                        },
                        child: Text(
                          'Get all Updates',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: height * 2,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          //-----------------------------------------------drawerButtons
          drawerButton(Icons.home, 'Dashboard'),
          drawerButton(Icons.show_chart, 'Reports'),
          drawerButton(Icons.monetization_on, 'Sales'),
          drawerButton(Icons.person_outline, 'Patients'),
          drawerButton(Icons.markunread_mailbox, 'Manage Products'),
          drawerButton(Icons.shopping_cart, 'Purchases'),
          drawerButton(Icons.store, 'Stocks'),
          drawerButton(Icons.account_balance_wallet, 'Accounts'),
          drawerButton(Icons.explicit, 'Expense'),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff00CCCC),
      title: Text(
        'Dashboard',
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

