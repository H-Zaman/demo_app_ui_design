import 'package:flutter/material.dart';
import 'package:testa/config.dart';

class NetIncome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double netIncome = 0;
    demoNetIncome.forEach((element) {
      netIncome+=element.amount;
    });
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 5,
          vertical: height
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //-----------------------------------------------------------titles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Income',
                style: TextStyle(
                    fontSize: height * 2.1,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                'Total Amount',
                style: TextStyle(
                    fontSize: height * 2.1,
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
          //--------------------------------------------------list view of items
          Flexible(
            child: ListView.builder(
              itemCount: demoNetIncome.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                var item = demoNetIncome[index];
                var amount = item.amount.isNegative ? item.amount * -1 : item.amount;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: height,
                  ),
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            width * 2
                        )
                    ),
                    child: Container(
                      height: height * 5,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * 2,
                              ),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: height * 1.9
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              ':',
                              style: TextStyle(
                                  fontSize: height * 1.9
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: width  *2
                              ),
                              child: Text(
                                '\$' +  amount.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: height * 1.9
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //-----------------------------------------------------------total
          Divider(thickness: width / 2,color: Colors.black54,height: height * 3,),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 2
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Net Income',
                  style: TextStyle(
                      fontSize: height * 2.1,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  '\$' + netIncome.ceilToDouble().toString(),
                  style: TextStyle(
                      fontSize: height * 2.1,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ModelNetIncome{
  String title;
  double amount;
  ModelNetIncome({this.title, this.amount});
}

List<ModelNetIncome> demoNetIncome = [
  ModelNetIncome(
      title: 'Total Revenue',
      amount: 533123.32
  ),
  ModelNetIncome(
      title: 'Total Expense',
      amount: -15541.35
  ),
];