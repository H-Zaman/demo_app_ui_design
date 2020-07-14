import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';


class SalesReportChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SalesReportChartState();
}

class SalesReportChartState extends State<SalesReportChart> {
  final Color firstRodColor = const Color(0xff4472C4);
  final Color secondRodColor = const Color(0xffED7D31);
  final Color thirdRodColor = const Color(0xff53fdd7);
  final Color fourthRodColor = const Color(0xffFFC000);
  final Color fifthRodColor = const Color(0xffA5A5A5);
  final Color sixthRodColor = const Color(0xff70AD47);
  final double width = 12;

  List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0,  10 , 20, 30);
    final barGroup2 = makeGroupData(1, 30, 10, 20,);
    final barGroup3 = makeGroupData(2,  10,  20, 25);
    final barGroup4 = makeGroupData(3, 30,  20, 10);
    final barGroup5 = makeGroupData(4, 30, 20,10);
    final barGroup6 = makeGroupData(5, 10, 5, 30);

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
    return AspectRatio(
      aspectRatio: 3,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 2)
        ),
        child: Padding(
          padding:  EdgeInsets.only(
            top: height * 2,
            left: width * 3,
            right: width * 5,
          ),
          child: BarChart(
            BarChartData(
              maxY: 35,
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (covariant){
                  return covariant % 2 == 0;
                },
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color:  Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: height * 1.3
                  ),
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Sales rep #1';
                      case 1:
                        return 'Sales rep #2';
                      case 2:
                        return 'Sales rep #3';
                      case 3:
                        return 'Sales rep #4';
                      case 4:
                        return 'Sales rep #5';
                      case 5:
                        return 'Sales rep #6';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color: const Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: height * 1.4
                  ),
                  margin: width * 2,
                  reservedSize: width*2,
                  interval: 1,
                  getTitles: (value) {
                    if(value == 0){
                      return '';
                    }
                    else if (value % 5 == 0){
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
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3/*, double y4, double y5, double y6*/) {
    return BarChartGroupData(barsSpace: 1, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: firstRodColor,
        width:  y1 > 0 ? width : 0,
      ),
      BarChartRodData(
        y: y2,
        color: secondRodColor,
        width: y2 > 0 ? width : 0,
      ),
      BarChartRodData(
          y: y3,
          color: thirdRodColor,
          width: y3 > 0 ? width : 0
      ),
      /*BarChartRodData(
          y: y4,
          color: fourthRodColor,
          width: y4 > 0 ? width : 0
      ),
      BarChartRodData(
          y: y5,
          color: fifthRodColor,
          width: y5 > 0 ? width : 0
      ),
      BarChartRodData(
          y: y6,
          color: sixthRodColor,
          width: y6 > 0 ? width : 0
      )*/
    ]);
  }
}