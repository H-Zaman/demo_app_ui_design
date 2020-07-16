import 'package:flutter/material.dart';
import 'package:testa/config.dart';

class ExpenseAndLoss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    double expenseAndLoss = 0;
    demoExpenseAndLoss.forEach((element) {
      expenseAndLoss+=element.amount;
    });
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 1.3
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Expense & Losses',
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
          ),
          //--------------------------------------------------list view of items
          Flexible(
            child: ListView.builder(
              itemCount: demoExpenseAndLoss.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                var item = demoExpenseAndLoss[index];
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 1.3
            ),
            child: Divider(thickness: width / 2,color: Colors.black54,height: height * 3,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 1.3
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Expense',
                  style: TextStyle(
                      fontSize: height * 2.1,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  '\$' + expenseAndLoss.ceilToDouble().toString(),
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
class ModelExpenseAndLoss{
  String title;
  double amount;
  ModelExpenseAndLoss({this.title, this.amount});
}

List<ModelExpenseAndLoss> demoExpenseAndLoss = [
  ModelExpenseAndLoss(
      title: 'Manufacture Payment',
      amount: 3123.32
  ),
  ModelExpenseAndLoss(
      title: 'Sale Return (Cash)',
      amount: -5541.35
  ),
  ModelExpenseAndLoss(
      title: 'Tax Payment',
      amount: 7850.36
  ),
  ModelExpenseAndLoss(
      title: 'Salary Payment',
      amount: 85324.36
  ),
  ModelExpenseAndLoss(
      title: 'Utilities Bill',
      amount: 999.99
  ),
  ModelExpenseAndLoss(
      title: 'Others',
      amount: 5541.35
  ),
];