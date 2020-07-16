import 'package:flutter/widgets.dart';

 class Config{
   static MediaQueryData _mediaQueryData;
   static double screenWidth;
   static double screenHeight;

   static double _safeAreaHorizontal;
   static double _safeAreaVertical;
   static double safeBlockHorizontal;
   static double safeBlockVertical;

   ///APPBAR
   static double appBarTitle;
   static double appBarIcon;
   static Size appBarSize;

   void init(BuildContext context) {

     //Screen Configuration
     _mediaQueryData = MediaQuery.of(context);
     screenWidth = _mediaQueryData.size.width;
     screenHeight = _mediaQueryData.size.height;

     _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
     _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
     safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
     safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;


     ///APPBAR
     appBarTitle = safeBlockHorizontal * 5;
     appBarIcon = safeBlockVertical * 4;
     appBarSize = Size(
         safeBlockHorizontal * 100,
         safeBlockVertical * 7
     );
   }
 }