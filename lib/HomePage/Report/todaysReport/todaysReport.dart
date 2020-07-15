import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:testa/HomePage/Home/sides/appBar.dart';
import 'package:testa/HomePage/Report/todaysReport/pages/expense&loss.dart';
import 'package:testa/HomePage/Report/todaysReport/pages/netIncome.dart';
import 'package:testa/HomePage/Report/todaysReport/pages/revenue&gain.dart';
import 'package:testa/config.dart';
import 'package:testa/customIcons/my_flutter_app_icons.dart';

class TodayReport extends StatefulWidget {
  @override
  _TodayReportState createState() => _TodayReportState();
}

class _TodayReportState extends State<TodayReport> {
  int currentIndex = 0;
  List<Widget> pages = [
    RevenueAndGain(),
    ExpenseAndLoss(),
    NetIncome(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.safeBlockVertical;
    final double width = SizeConfig.safeBlockHorizontal;
    return Scaffold(
      appBar: MyAppBar(title: 'Today\'s Report',),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xff00CCCC),
        selectedIndex: currentIndex,
        iconSize: SizeConfig.appBarIcon,
        showElevation: true,
        itemCornerRadius: width * 2,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.profit),
            title: Text(
              'Revenue\n& Gain',
              maxLines: 2,
              style: TextStyle(
                  fontSize: height * 1.7
              ),
            ),
            activeColor: Color(0xff196EE6),
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.bill),
            title: Text(
              'Expense\n& Loss',
              maxLines: 2,
              style: TextStyle(
                fontSize: height * 1.7
              ),
            ),
            activeColor: Color(0xff196EE6),
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.money_bag),
            title: Text(
              'Net Income',
              maxLines: 2,
              style: TextStyle(
                  fontSize: height * 1.7
              ),
            ),
            activeColor: Color(0xff196EE6),
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
