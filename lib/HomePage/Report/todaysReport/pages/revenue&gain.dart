import 'package:flutter/material.dart';
import 'package:testa/config.dart';

class RevenueAndGain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double totalRevenue = 0;
    demoSalesRevenue.forEach((element) {
      totalRevenue+=element.amount;
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
          SizedBox(height: height,),
          //-----------------------------------------------------------titles
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 1.3
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Revenues and Gains',
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
          SizedBox(height: height,),

          //--------------------------------------------------list view of items
          Flexible(
            child: ListView.builder(
              itemCount: demoSalesRevenue.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                var item = demoSalesRevenue[index];
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
                                '\$' + item.amount.toString(),
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
                  'Total Revenues',
                  style: TextStyle(
                      fontSize: height * 2.1,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  '\$' + totalRevenue.ceilToDouble().toString(),
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


class ModelSalesRevenue{
  String title;
  double amount;
  ModelSalesRevenue({this.title, this.amount});
}

List<ModelSalesRevenue> demoSalesRevenue = [
  ModelSalesRevenue(
    title: 'Sales Revenues',
    amount: 123.32
  ),
  ModelSalesRevenue(
    title: 'Receivables Dues',
    amount: 321.98
  ),
  ModelSalesRevenue(
    title: 'Due Collection',
    amount: 6781.12
  ),
  ModelSalesRevenue(
    title: 'Purchase Return (Cash)',
    amount: 1234.98
  ),
  ModelSalesRevenue(
    title: 'Others',
    amount: 1576.54
  )
];