import 'package:flutter/material.dart';
import 'package:testa/HomePage/Home/sides/drawer.dart';
import 'package:testa/config.dart';

class ReportHome extends StatefulWidget {
  @override
  _ReportHomeState createState() => _ReportHomeState();
}

class _ReportHomeState extends State<ReportHome> {

  final duplicateItems = demoReport;
  var items = List<ModelReport>();


  @override
  void initState() {
    super.initState();
    items.addAll(duplicateItems);
  }

  void filterSearchResults(String query) {
    List<ModelReport> dummySearchList = List<ModelReport>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<ModelReport> dummyListData = List<ModelReport>();
      dummySearchList.forEach((item) {
        if(item.invoiceNo.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
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
          ),
        ),
        drawer: MyDrawer(userName: 'Annie',),
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: height,
            horizontal: width * 5
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
//            color: Colors.red,
                  height: height * 8,
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 5
                  ),
                  padding: EdgeInsets.all(height * 1),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    style: TextStyle(
                        fontSize: height * 2.5
                    ),
//                  autofocus: true,
                    decoration: InputDecoration.collapsed(
                      hintText: "Search By ID",
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(width * 2)
                      )),
                    ).copyWith(
                      labelText: "Search By ID",
                      prefixIcon: Icon(Icons.search),
                    ),
                  )
              ),
              SizedBox(height: height * 2,),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'SL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 2.5
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text(
                        'Invoice No.',
                        style: TextStyle(
                            fontSize: height * 2.5,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '\$ Price',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 2.5,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 1,),
              //TODO should be expanded
              Container(
                height: height * 60,
                child: ListView.builder(
                  itemCount: items.length,
//                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    var item = items[index];
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
                                                'Serial no.',
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
                                                'Invoice no.',
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
                                                item.invoiceNo,
                                                style: TextStyle(
                                                    fontSize: height * 2.1,
                                                    color: Colors.black
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 5,
                                      color: Color(0xffE2EAFA ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding: EdgeInsets.only(left: width * 4),
                                              child: Text(
                                                'Customer name',
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
                                                item.customerName,
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
                                                'Total',
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
                                                item.total.toString(),
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
                                                'Tax',
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
                                                item.tax.toString(),
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
                                                'Discount',
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
                                                item.discount.toString(),
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
                                                'Grand-total',
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
                                                item.grandTotal.toString(),
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
                                                'Net-amount',
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
                                                item.netAMount.toString(),
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
                                                'Due',
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
                                                item.due.toString(),
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
                              flex: 1,
                              child: Center(
                                child: Text(
                                  (index+1).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 2.5
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Center(
                                child: Text(
                                  item.invoiceNo,
                                  style: TextStyle(
                                      fontSize: height * 2.5
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '\$ ' + item.tax.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 2.5,
                                  color: Colors.green
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height,),
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
                    'Showing ' + (1).toString() +' - '+ (demoReport.length).toString() + ' out of ' + demoReport.length.toString(),
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
            ],
          ),
        )
      ),
    );
  }
}

class ModelReport{
  String date;
  String invoiceNo;
  String customerName;
  double total;
  double tax;
  double discount;
  double grandTotal;
  double netAMount;
  double due;

  ModelReport({this.date, this.total,this.customerName,this.invoiceNo,this.discount,this.due,this.grandTotal,this.netAMount,this.tax});
}

final List<ModelReport> demoReport = [
  ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),
  ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),ModelReport(
    date: '12 July 2020',
    invoiceNo: 'ERT897ERER9T',
    customerName: 'Annie LockHeart',
    total: 2540.60,
    tax: 120.0,
    discount: 300,
    grandTotal: 3198.23,
    netAMount: 1234.98,
    due: 2800.12,
  ),
];