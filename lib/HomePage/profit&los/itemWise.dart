import 'package:flutter/material.dart';
import 'package:testa/HomePage/Home/sides/appBar.dart';
import 'package:testa/HomePage/Home/sides/drawer.dart';
import 'package:testa/HomePage/profit&los/data.dart';
import 'package:testa/HomePage/profit&los/model.dart';
import 'package:testa/config.dart';

class ItemWise extends StatefulWidget {
  @override
  _ItemWiseState createState() => _ItemWiseState();
}

class _ItemWiseState extends State<ItemWise> {
  final duplicateItems = demoDataProfitAndLoss;
  var items = List<ModelProfitAndLoss>();

  @override
  void initState() {
    super.initState();
    items.addAll(duplicateItems);
  }
  void filterSearchResults(String query) {
    List<ModelProfitAndLoss> dummySearchList = List<ModelProfitAndLoss>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<ModelProfitAndLoss> dummyListData = List<ModelProfitAndLoss>();
      dummySearchList.forEach((item) {
        if(item.itemName.toLowerCase().contains(query.toLowerCase())) {
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

    double total = 0;
    demoDataProfitAndLoss.forEach((element) {total+=(element.saleValue - element.purchaseValue);});
    int totalQuantity = 0;
    demoDataProfitAndLoss.forEach((element) {totalQuantity+=element.saleQuantity;});

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
          appBar: MyAppBar(title: 'Item Wise',),
          drawer: MyDrawer(userName: 'Annie',),
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical: height,
                horizontal: width * 2
            ),
            child: SingleChildScrollView(
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
                          hintText: "Search By Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(width * 2)
                              )),
                        ).copyWith(
                          labelText: "Search By Name",
                          prefixIcon: Icon(Icons.search),
                        ),
                      )
                  ),
                  SizedBox(height: height * 2,),
                  Container(
                    height: height * 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 2),
                      color: Color(0xff00CCCC),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 2
                            ),
                            child: Text(
                              'Name of Item',
                              style: TextStyle(
                                  fontSize: height * 2.3,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 2
                            ),
                            child: Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: height * 2.3,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Net Profit/Loss',
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
                    itemCount: items.length,
                    physics: NeverScrollableScrollPhysics(),
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
                                          color: Colors.white,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 5,
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: width * 4),
                                                  child: Text(
                                                    'Sale Quantity',
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
                                                    item.saleQuantity.toString(),
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
                                                    'Item name',
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
                                                    item.itemName,
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
                                                    'Average Sale',
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
                                                    item.avgSaleValue.toString(),
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
                                                    'Average Purchase',
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
                                                    item.avgPurchaseValue.toString(),
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
                                                    'Sale value',
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
                                                    '\$' + item.saleValue.toString(),
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
                                                    'Purchase value',
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
                                                    '\$' + item.purchaseValue.toString(),
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
                                                    'Profit/Loss',
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
                                                    '\$' + (item.saleValue - item.purchaseValue).toString(),
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
                                flex: 5,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 2
                                  ),
                                  child: Text(
                                    item.itemName,
                                    style: TextStyle(
                                        fontSize: height * 2
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 2
                                  ),
                                  child: Text(
                                    totalQuantity.toString(),
                                    style: TextStyle(
                                        fontSize: height * 2.3,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  (item.saleValue - item.purchaseValue).toString(),
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
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 2
                            ),
                            child: Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: height * 2.3,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 2
                            ),
                            child: Text(
                              totalQuantity.toString(),
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
                            total.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 2.3,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
