import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config.dart';


class AllReportSummary2 extends StatefulWidget {
  @override
  _AllReportSummary2State createState() => _AllReportSummary2State();
}

class _AllReportSummary2State extends State<AllReportSummary2> {
  final Color color1 = const Color(0xff1F77B4);
  final double width = 8 ;

  List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 100, 250 ,500, 750, 1000);
    final barGroup2 = makeGroupData(1, 200, 400 ,500, 600, 330);
    final barGroup3 = makeGroupData(2, 250, 500 ,750, 1000, 500);
    final barGroup4 = makeGroupData(3, 300, 500 ,800, 1000, 100);
    final barGroup5 = makeGroupData(4, 400, 600 ,800, 1100,900);
    final barGroup6 = makeGroupData(5, 700, 900 ,0, 0,200);

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
      child: Padding(
        padding:  EdgeInsets.only(
            top: height * 2,
            left: width * 2,
            right: width * 2,
            bottom: height
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width * 88,
              height: height * 18,
              child: BarChart(
                BarChartData(
                  maxY: 1100,
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: height * 1.4,
                          color: Colors.black
                        )
                      ),
                      getTitles: (double value){
                        switch (value.toInt()) {
                          case 0:
                            return '2015';
                          case 1:
                            return '2016';
                          case 2:
                            return '2017';
                          case 3:
                            return '2018';
                          case 4:
                            return '2019';
                          case 5:
                            return '2020';
                          default:
                            return '';
                        }
                      }
                    ),
                    leftTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff4e4965),
                        width: width/3,
                      ),
                      left: BorderSide(
                        color: Colors.transparent,
                      ),
                      right: BorderSide(
                        color: Colors.transparent,
                      ),
                      top: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  barGroups: showingBarGroups,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: height * 1.5,
                  width: width * 3,
                  color: color1,
                ),
                SizedBox(width: width,),
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: height * 1.4,
                    color: Colors.black
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y1, double y2, double y3, double y4, double y5) {
    return BarChartGroupData(barsSpace: 1, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: color1,
        width: y1 > 0 ? width : 0,
      ),
      BarChartRodData(
        y: y2,
        color: color1,
        width: y2 > 0 ? width : 0,
      ),
      BarChartRodData(
          y: y3,
          color: color1,
          width: y3 > 0 ? width : 0
      ),
      BarChartRodData(
          y: y4,
          color: color1,
          width: y4 > 0 ? width : 0
      ),
      BarChartRodData(
          y: y5,
          color: color1,
          width: y5 > 0 ? width : 0
      ),
    ]);
  }
}