import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testa/HomePage/Home/sides/appBar.dart';
import 'package:testa/HomePage/Home/sides/drawer.dart';
import 'package:testa/HomePage/financialStatements/demoData.dart';
import 'package:testa/config.dart';

class CashFlow extends StatefulWidget {
  @override
  _CashFlowState createState() => _CashFlowState();
}

class _CashFlowState extends State<CashFlow> {

  String _startDate = 'MMM-DD-YYYY';
  String _endDate = 'MMM-DD-YYYY';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;

    double total = 0;
    demoDataCashOnSale.forEach((element) {total+=element.payment;});

    return Scaffold(
        appBar: MyAppBar(title: 'Cash Flow',),
        drawer: MyDrawer(userName: 'Annine',),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: height * 93.6,
            child: Column(
              children: <Widget>[
                //-----------------------------------------------------top stuff
                Card(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 2
                  ),
                  elevation: 3.0,
                  child: Container(
                    height: height * 7,
                    padding: EdgeInsets.symmetric(
                        vertical: height,
                        horizontal: width * 2
                    ),
                    child: Row(
                      children: <Widget>[
                        //-----------------------------------------start date
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: GestureDetector(
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2100),
                                ).then((value) {
                                  setState(() {
                                    _startDate = DateFormat.yMMMd().format(value);
                                  });
                                  print(_startDate);
                                });
                              },
                              child: Text(
                                _startDate ?? '',
                                style: TextStyle(
                                    fontSize: height  *2.2
                                ),
                              ),
                            ),
                          ),
                        ),
                        //-----------------------------------------end date
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: GestureDetector(
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2100),
                                ).then((value) {
                                  setState(() {
                                    _endDate = DateFormat.yMMMd().format(value);
                                  });
                                });
                              },
                              child: Text(
                                _endDate ?? '',
                                style: TextStyle(
                                    fontSize: height  *2.2
                                ),
                              ),
                            ),
                          ),
                        ),
                        //-----------------------------------------search
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: SizeConfig.appBarIcon,
                            ),
                          ),
                        ),
                        //-----------------------------------------refresh
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.grey,
                              size: SizeConfig.appBarIcon,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //-----------------------------------------------------mid stuff
                SizedBox(height: height * 2,),
                Container(
                  height: height * 6,
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 2
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 2),
                    color: Color(0xff00CCCC),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 2
                          ),
                          child: Text(
                            'Date',
                            style: TextStyle(
                                fontSize: height * 2.3,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 2
                          ),
                          child: Text(
                            'Invoice',
                            style: TextStyle(
                                fontSize: height * 2.3,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 2.3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 1,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: demoDataCashOnSale.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    var item = demoDataCashOnSale[index];
                    return GestureDetector(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content:
                                Container(
                                  width: width * 90,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        height: height * 5,
                                        color: Color(0xff00CCCC),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Details',
                                                  style: TextStyle(
                                                      fontSize: height * 2.3,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  'Information',
                                                  style: TextStyle(
                                                      fontSize: height * 2.3,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height * 5,
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Serial',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  (index+1).toString(),
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height * 5,
                                        color: Color(0xffE2EAFA),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Date',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  item.date,
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height * 5,
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Transaction ID',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  item.invoice,
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height * 5,
                                        color: Color(0xffE2EAFA),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Vendor name',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  item.vendorName,
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height * 5,
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Payment',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  '\$' + item.payment.toString(),
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: height * 5,
                                        color: Color(0xffE2EAFA),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Received',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  '\$' + item.received.toString(),
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 4),
                                                child: Text(
                                                  'Description',
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width * 2),
                                                child: Text(
                                                  item.description,
                                                  style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        color: index % 2 == 0 ? Colors.white : Color(0xffDDE5F5),
                        height: height * 6,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 4
                                ),
                                child: Text(
                                  item.date,
                                  style: TextStyle(
                                      fontSize: height * 2
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 2
                                ),
                                child: Text(
                                  item.invoice,
                                  style: TextStyle(
                                    fontSize: height * 2.3,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                '\$' + item.payment.toString(),
                                style: TextStyle(
                                  fontSize: height * 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: height,),
                Container(height: height * 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 2),
                    color: Color(0xff00CCCC),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 2
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 2
                          ),
                          child: Text(
                            '',
                            style: TextStyle(
                                fontSize: height * 2.3,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Total',
                          style: TextStyle(
                              fontSize: height * 2.3,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '\$' + total.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 2.3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //-----------------------------------------------------bottom stuff
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: width * 5,
                      ),
                    ),
                    Text(
                      'Showing ' + '1' +' - '+ '13' + ' out of ' + '100',
                      style: TextStyle(
                          fontSize: height * 2,
                          color: Color(0xff727C8E)
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: width * 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height,)
              ],
            ),
          ),
        )
    );
  }
}
