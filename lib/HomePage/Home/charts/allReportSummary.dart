import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config.dart';


class AllReportSummary extends StatefulWidget {
  @override
  _AllReportSummaryState createState() => _AllReportSummaryState();
}

class _AllReportSummaryState extends State<AllReportSummary> {
  final Color color1 = const Color(0xff16CC62);
  final Color color2 = const Color(0xffE6196E);
  final Color color3 = const Color(0xff19C3E6);
  final Color color4 = const Color(0xffE6B219);
  final Color color5 = const Color(0xff196EE6);
  final Color color6 = const Color(0xff116149);
  final Color color7 = const Color(0xffE65D19);
  final double width = 12 ;

  List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 250, 630, 230);
    final barGroup2 = makeGroupData(1, 730, 1420, 2000);
    final barGroup3 = makeGroupData(2, 200, 700, 400);
    final barGroup4 = makeGroupData(3, 450, 300, 900);
    final barGroup5 = makeGroupData(4,1100,1700, 2000);
    final barGroup6 = makeGroupData(5,500,2100, 1500,);


    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
    ];

    showingBarGroups = items;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 2)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: width / 2,),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'count (unwind array "items")',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: height * 1.4
                  )
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: height * 24,
                width: width * 85,
                child: Padding(
                  padding:  EdgeInsets.only(
                      top: height * 2,
                      left: width,
                      bottom: height
                  ),
                  child: BarChart(
                    BarChartData(
                      maxY: 2300,
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: false,
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: const Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: height * 1.4
                          ),
                          reservedSize: width * 5,
                          interval: 1,
                          getTitles: (value) {
                            if (value % 200 == 0){
                              return '${value.round()}';
                            }
                            else
                              return '';
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color1,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'paper',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color2,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'laptop',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color3,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'pens',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),
                  /*Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color4,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'envelopes',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color5,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'binder',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color6,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'notepad',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: height * 1.5,
                        width: width * 3,
                        color: color7,
                      ),
                      SizedBox(width: width,),
                      Text(
                        'backpack',
                        style: TextStyle(
                            fontSize: height * 1.6
                        ),
                      )
                    ],
                  ),*/
                ],
              ),
              SizedBox(height: height,)
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y1, double y2, double y3, /*double y4, double y5, double y6, double y7*/) {
    double bar1 = y1<1 ? 0 : y1;
    double bar2 = y2<1 ? 0 : y2;
    double bar3 = y3<1 ? 0 : y3;
    /*double bar4 = y4<1 ? 0 : y4;
    double bar5 = y5<1 ? 0 : y5;
    double bar6 = y6<1 ? 0 : y6;
    double bar7 = y7<1 ? 0 : y7;*/

    return BarChartGroupData(barsSpace: 1, x: x, barRods: [
      BarChartRodData(
        y: bar1,
        color: color1,
        width: bar1 > 0 ? width : 0,
      ),
      BarChartRodData(
        y: bar2,
        color: color2,
        width: bar2 > 0 ? width : 0,
      ),
      BarChartRodData(
          y: bar3,
          color: color3,
          width: bar3 > 0 ? width : 0
      ),
      /*BarChartRodData(
          y: bar4,
          color: color4,
          width: bar4 > 0 ? width : 0
      ),
      BarChartRodData(
          y: bar5,
          color: color5,
          width: bar5 > 0 ? width : 0
      ),
      BarChartRodData(
          y: bar6,
          color: color6,
          width: bar6 > 0 ? width : 0
      ),
      BarChartRodData(
          y: bar7,
          color: color7,
          width: bar7 > 0 ? width : 0
      )*/
    ]);
  }
}