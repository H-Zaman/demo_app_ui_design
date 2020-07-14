import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config.dart';


class LowQuantity extends StatelessWidget {
  final Color textColor = Color(0xff727C8E);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: width,),
            Expanded(
              flex: 4,
              child: Text(
                'Medicine Name',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: height * 1.7,
                      color: textColor
                  )
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'Quantity',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: height * 1.7,
                          color: textColor
                      )
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'MRP',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: height * 1.7,
                          color: textColor
                      )
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: demoDataLowQuantity.length,
              shrinkWrap: true,
              primary: false,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                var item = demoDataLowQuantity[index];
                return Container(
                  height: height * 8.8,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: width * .05
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: width * .05
                      )
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: width,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.title,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: height * 1.7
                                )
                              ),
                            ),
                            Text(
                              item.subtitle,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: height * 1.7,
                                    color: textColor
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            item.quantity.toString() + ' Box',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7
                                )
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            '\$ ' + item.price.toString(),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: height * 1.7
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

final List<ModelLowQuantity> demoDataLowQuantity = [
  ModelLowQuantity(
    title:  'Syp Ace Padiatric',
    subtitle: 'Syrup Ace Padiatric',
    quantity: 3,
    price: 104.99
  ),
  ModelLowQuantity(
    title: 'Tab. Gastronal',
    subtitle: 'Tablet Gastronal',
    quantity: 9,
    price: 67.78
  ),
  ModelLowQuantity(
    title: 'Zyfolet Tab',
    subtitle: 'Tablet Zyfolet',
    quantity: 5,
    price: 123.32
  ),
  ModelLowQuantity(
      title:  'Syp Ace Padiatric',
      subtitle: 'Syrup Ace Padiatric',
      quantity: 3,
      price: 104.99
  ),
  ModelLowQuantity(
      title: 'Tab. Gastronal',
      subtitle: 'Tablet Gastronal',
      quantity: 9,
      price: 67.78
  ),
  ModelLowQuantity(
      title: 'Zyfolet Tab',
      subtitle: 'Tablet Zyfolet',
      quantity: 5,
      price: 123.32
  ),
  ModelLowQuantity(
      title:  'Syp Ace Padiatric',
      subtitle: 'Syrup Ace Padiatric',
      quantity: 3,
      price: 104.99
  ),
  ModelLowQuantity(
      title: 'Tab. Gastronal',
      subtitle: 'Tablet Gastronal',
      quantity: 9,
      price: 67.78
  ),
  ModelLowQuantity(
      title: 'Zyfolet Tab',
      subtitle: 'Tablet Zyfolet',
      quantity: 5,
      price: 123.32
  ),
];

class ModelLowQuantity{
  String title;
  String subtitle;
  int quantity;
  double price;

  ModelLowQuantity({this.title, this.subtitle, this.quantity, this.price});
}
