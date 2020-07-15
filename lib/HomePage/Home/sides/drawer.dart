import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testa/HomePage/Home/homePage.dart';
import 'package:testa/HomePage/Report/reportHome.dart';
import 'package:testa/HomePage/Report/todaysReport/todaysReport.dart';
import 'package:testa/HomePage/profit&los/itemWise.dart';
import 'package:testa/HomePage/profit&los/saleWise.dart';
import 'package:testa/HomePage/stocks/batchStock.dart';
import 'package:testa/HomePage/stocks/closingStocks.dart';
import 'package:testa/HomePage/stocks/empiryStock.dart';
import 'package:testa/HomePage/stocks/lowStocks.dart';
import 'package:testa/config.dart';
import 'package:testa/error404.dart';

class MyDrawer extends Drawer {
  final String userName;
  const MyDrawer({this.userName});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;

    drawerButton(IconData icon, String title,Widget path,List<Widget> widgets,) {
      return widgets.length > 0 ? Container(
//        height: height * 8,
        decoration: BoxDecoration(
//          color: Colors.red,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: width * .05
            )
          )
        ),
        child: ExpansionTile(
          leading: Icon(
            icon,
            size: SizeConfig.appBarIcon * .9,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: height * 2.3
            ),
          ),
          /*trailing: Icon(
            Icons.arrow_forward_ios,
            size: SizeConfig.appBarIcon*.5,
            color: Color(0xff737373),
          ),*/
          children: widgets.length > 0 ? widgets : null,
        ),
      )
      :
      Container(
        height: height * 7.5,
        decoration: BoxDecoration(
//            color: Colors.green,
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey,
                    width: width * .05
                )
            )
        ),
        child: FlatButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> path));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: width*1,),
              //----------------------------------------------main icon
              Icon(
                icon,
                size: SizeConfig.appBarIcon * .9,
                color: Color(0xff737373),
              ),
              SizedBox(width: width*5.3,),
              //----------------------------------------------title
              Text(
                title,
                style: TextStyle(
                  fontSize: height * 2.3,
                  color: Color(0xff222222),
                )
              ),
              Spacer(),
              //----------------------------------------------next icon
              Icon(
                Icons.arrow_forward_ios,
                size: SizeConfig.appBarIcon*.5,
                  color: Color(0xff737373),
              )
            ],
          ),
        ),
      );
    }

    return Drawer(
      child: SingleChildScrollView(
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
            drawerButton(Icons.home, 'Dashboard', MyHomePage(), []),
            drawerButton(Icons.show_chart, 'Reports', ReportHome(), [
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TodayReport()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Today\'s Report',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportHome()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Sales Report',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            drawerButton(Icons.monetization_on, 'Sales', ERROR404(),[
              FlatButton(
                onPressed: (){},
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Profit & Loss',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Sales Report',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            drawerButton(Icons.person_outline, 'Patients', ERROR404(),[
              FlatButton(
                onPressed: (){},
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Patient Menu 1',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Patient Menu 2',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Patient Menu 3',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Patient Menu 4',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            drawerButton(Icons.markunread_mailbox, 'Manage Products', ERROR404(),[]),
            drawerButton(Icons.shopping_cart, 'Profit and Loss', ERROR404(),[
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SaleWise()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Sale Wise',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemWise()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Item Wise',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            drawerButton(Icons.store, 'Stocks', ERROR404(),[
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LowStocks()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Low Stocks',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExpiryStocks()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Expiry Stock',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClosingStocks()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Closing Stocks',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BatchStocks()));
                },
                child: Container(
                  height: height * 4,
                  child: Center(
                    child: Text(
                      'Batch Stock',
                      style: TextStyle(
                          fontSize: height * 1.9
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            drawerButton(Icons.account_balance_wallet, 'Accounts', ERROR404(),[]),
            drawerButton(Icons.explicit, 'Expense', ERROR404(),[]),
          ],
        ),
      ),
    );
  }
}