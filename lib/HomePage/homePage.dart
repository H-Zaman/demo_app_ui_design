import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';
import 'Home/cards/lowQuantity.dart';
import 'Home/cards/upcomingExpiryDate.dart';
import 'Home/charts/allReportSummary.dart';
import 'Home/charts/allReportSummary2.dart';
import 'Home/charts/salesReport.dart';
import 'Home/sides/appBar.dart';
import 'Home/sides/drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  String userName = 'Annie';
  String totalSale = '123, 456, 789';
  String totalPurchased = '456, 789, 123';
  String totalExpense = '789, 123, 456';
  String saleInvoice = '852, 147, 963';

  Color textColor = Color(0xff727C8E);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;

    double titleSize = height * 2.3;
    double subTitleSize = height * 1.7;

    //--------------------------------------------------------------------top cards template
    Widget topCards(String title,String icon, String value){
      return Expanded(
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
                  child: Image.asset(
                    icon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: height * 1.8,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
            subtitle: Text(
              '\$ ' + value,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: height * 1.8,
                      color: Colors.grey[550]
                  )
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: 'Dashboard',),
        drawer: MyDrawer(userName: userName,),
        body: Scrollbar(
          key: UniqueKey(),
          child: Container(
            margin: EdgeInsets.symmetric(
              //TODO if 4 aligns with appbar icons
                horizontal: width * 4
            ),
            padding: EdgeInsets.only(
                top: height * 1
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
                              topCards('Total Sale', 'asset/icons/law.png', totalSale),
                              SizedBox(width: width,),
                              //----------------------card 2
                              topCards('Total Purchased', 'asset/icons/supermarket.png', totalPurchased),
                            ],
                          ),
                        ),
                        //---------------------------------card 3 card 4
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              //----------------------card 3
                              topCards('Total Expense', 'asset/icons/rich.png', totalExpense),
                              SizedBox(width: width,),
                              //----------------------card 4
                              topCards('Sale Invoice', 'asset/icons/report.png', saleInvoice),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 2,),
                  //-----------------------------------------------sales report
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //----------------------------------------------------text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Sales Report',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          Text(
                            'Weekly',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00cccc)
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height,),
                      //----------------------------------------------------chart
                      Container(
                        height: height * 22,
                        child: SalesReportChart(),
                      )
                    ],
                  ),
                  SizedBox(height: height * 2,),
                  //-----------------------------------------------All Report Summary
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //----------------------------------------------------text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'All Report Summary',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          Text(
                            'Monthly',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00cccc)
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height,),
                      //----------------------------------------------------chart
                      Container(
                        height: height * 30,
                        child: AllReportSummary(),
                      )
                    ],
                  ),
                  SizedBox(height: height * 2,),
                  //-----------------------------------------------All Report Summary 2
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //----------------------------------------------------text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'All Report Summary',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          Text(
                            'Yearly',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00cccc)
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height,),
                      //----------------------------------------------------chart
                      Container(
                        height: height * 25,
                        child: AllReportSummary2(),
                      )
                    ],
                  ),
                  SizedBox(height: height * 2,),
                  //-----------------------------------------------Low Quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //----------------------------------------------------text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Low Quantity',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: titleSize,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                              Text(
                                'Medicine with lowest quantity',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: subTitleSize,
                                        color: textColor
                                    )
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Weekly',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00cccc)
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height,),
                      //----------------------------------------------------chart
                      Card(
                        elevation: 2.0,
                        child: Container(
                          height: height * 30,
                          child: LowQuantity(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 2,),
                  //-----------------------------------------------Upcoming Expiry Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //----------------------------------------------------text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Upcoming Expiry Date',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: titleSize,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                              Text(
                                'Medicine with upcoming Expiry date',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: subTitleSize,
                                      color: textColor
                                  )
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Weekly',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00cccc)
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height,),
                      //----------------------------------------------------chart
                      Card(
                        elevation: 2.0,
                        child: Container(
                          height: height * 30,
                          child: UpcomingExpiryDate(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 2,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}