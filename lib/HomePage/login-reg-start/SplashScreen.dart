import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testa/HomePage/Home/homePage.dart';
import 'RegistrationScreen.dart';
import 'config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _rememberMe = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //fade
  AnimationController fadeController;
  AnimationController fadeOutController;
  Animation<double> _fadeIn;
  Animation<double> _fadeOut;

  //scale
  var squareScaleA = 1.0;

  //controllers
  AnimationController scaleController;
  AnimationController translateController;
  Animation<double> animationTranslate;
  AnimationController translateLogoController;
  Animation<double> animationLogoTranslate;

  @override
  void dispose() {
    super.dispose();
    fadeController.dispose();
    fadeOutController.dispose();
    translateController.dispose();
    translateLogoController.dispose();
    scaleController.dispose();

    email.dispose();
    password.dispose();
  }

//
//  void navigationPage() {
//    Navigator.pushReplacementNamed(
//      context,
//      '/Login',
//    );
//  }
//
//  startTime() async {
//    var _duration = new Duration(seconds: 3);
//    return new Timer(_duration, navigationPage);
//  }

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    } else {
      // startTime();

      //Splash intro
      fadeController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 2000),
      );
      fadeController.forward();

      //Splash outro fade
      fadeOutController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );

      //Splash outro translate
      translateController = AnimationController(
          duration: Duration(milliseconds: 500), vsync: this)
        ..addListener(() => setState(() {}));

      translateLogoController = AnimationController(
          duration: Duration(milliseconds: 500), vsync: this)
        ..addListener(() => setState(() {}));

      //Splash outro scale
      scaleController = AnimationController(
          vsync: this,
          lowerBound: 0.7,
          upperBound: 1.0,
          duration: Duration(milliseconds: 500));
      scaleController.addListener(() {
        setState(() {
          squareScaleA = scaleController.value;
        });
      });

      fadeController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fadeOutController.forward();
          translateController.forward();
          translateLogoController.forward();
          scaleController.reverse(from: 1.0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    _fadeIn = Tween<double>(begin: 0.0, end: 1).animate(fadeController);
    _fadeOut = Tween<double>(begin: 1.0, end: 0).animate(fadeOutController);
    animationTranslate = Tween(begin: Config.safeBlockVertical * 75, end: 0.0)
        .animate(translateController);
    animationLogoTranslate = Tween(
            begin: Config.safeBlockVertical * 10,
            end: Config.safeBlockVertical * 5)
        .animate(translateLogoController);
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/splash/splash_forground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Transform.scale(
                  scale: squareScaleA,
                  child: Transform.translate(
                    offset: Offset(0, animationLogoTranslate.value),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          FadeTransition(
                            opacity: _fadeIn,
                            child: Container(
                              width: Config.safeBlockHorizontal * 20,
                              height: Config.safeBlockVertical * 15,
                              child: Image.asset(
                                "asset/splash/pharmasale_logo.png",
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity: _fadeIn,
                            child: Container(
                              child: Text(
                                'PharmaSale',
                                style: TextStyle(
                                  color: Color(0xffffffff),
//                                  fontFamily: 'Poppins',
                                  fontSize: Config.safeBlockVertical * 4.5,
                                  fontWeight: FontWeight.bold,
                                  //  letterSpacing: Config.safeBlockHorizontal*.5
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Config.safeBlockVertical * 6,
              ),
              Container(
                width: Config.safeBlockHorizontal * 100,
                child: Stack(
                  children: <Widget>[
                    FadeTransition(
                      opacity: _fadeOut,
                      child: Container(
                        alignment: Alignment.center,
                        width: Config.safeBlockHorizontal * 100,
                        height: Config.safeBlockVertical * 66.1,
                        child: Image.asset(
                          "asset/splash/splash_asset.png",
                          width: Config.safeBlockHorizontal * 85,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, animationTranslate.value),
                      child: Container(
                        width: Config.safeBlockHorizontal * 100,
                        height: Config.safeBlockVertical * 75.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Config.safeBlockHorizontal * 7),
                            topRight:
                                Radius.circular(Config.safeBlockHorizontal * 7),
                          ),
                          color: Color(0xffF7F7F7),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Config.safeBlockHorizontal * 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: Config.safeBlockVertical * 5,
                              ),
                              Container(
                                child: Text(
                                  'Hello There!',
                                  style: TextStyle(
                                    color: Color(0xff00CCCC),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 3.5,
                                    fontWeight: FontWeight.bold,
                                    //  letterSpacing: Config.safeBlockHorizontal*.5
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Sign in to continue',
                                  style: TextStyle(
                                    color: Color(0xff396BCF),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2,
                                    fontWeight: FontWeight.normal,
                                    //  letterSpacing: Config.safeBlockHorizontal*.5
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Config.safeBlockVertical * 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Config.safeBlockHorizontal *8),
                                    color: Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.2),
                                        spreadRadius: 1,
                                        blurRadius: 20,
                                        offset: Offset(-10, 10), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                      height: Config.safeBlockHorizontal * 15,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Stack(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: 2.35,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        height: Config
                                                                .safeBlockHorizontal *
                                                            15,
                                                        width: Config
                                                                .safeBlockHorizontal *
                                                            15,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    0xff00CCCB)),
                                                      ),
                                                      Container(
                                                        ///must be half of the above container
                                                        height: Config
                                                                .safeBlockHorizontal *
                                                            8,
                                                        width: Config
                                                                .safeBlockHorizontal *
                                                            8,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xff00CCCB)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Icon(
                                                    Icons.person_outline,
                                                    color: Colors.white,
                                                    size: Config
                                                            .safeBlockHorizontal *
                                                        7,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: Config.safeBlockHorizontal * 50,
                                            margin: EdgeInsets.only(left: Config.safeBlockHorizontal * 5),
                                            padding: EdgeInsets.only(
                                              left: Config.safeBlockHorizontal * 2
                                            ),
                                            child: TextField(
                                              controller: email,
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
//                                                  fontFamily: 'Poppins',
                                                  fontSize:
                                                      Config.safeBlockVertical *
                                                          2.3,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                    color: Color(0xffD85053),
                                                    fontFamily: 'Poppins',
                                                    fontSize: Config
                                                            .safeBlockVertical *
                                                        2,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText: 'User Name',
                                                  hintStyle: TextStyle(
//                                                    color: Color(0xffC8C9C9),
//                                                    fontFamily: 'Poppins',
                                                    fontSize: Config
                                                            .safeBlockVertical *
                                                        2,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
//                                                  labelText: 'Email Address'
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))),
                              SizedBox(
                                height: Config.safeBlockVertical * 3,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Config.safeBlockHorizontal * 8),
                                    color: Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.2),
                                        spreadRadius: 1,
                                        blurRadius: 20,
                                        offset: Offset(-10,
                                            10), //changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                      height: Config.safeBlockHorizontal * 15,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Stack(
                                              children: <Widget>[
                                                Transform.rotate(
                                                  angle: 2.35,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        height: Config
                                                                .safeBlockHorizontal *
                                                            15,
                                                        width: Config
                                                                .safeBlockHorizontal *
                                                            15,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    0xff00CCCB)),
                                                      ),
                                                      Container(
                                                        ///must be half of the above container
                                                        height: Config
                                                                .safeBlockHorizontal *
                                                            8,
                                                        width: Config
                                                                .safeBlockHorizontal *
                                                            8,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xff00CCCB)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Icon(
                                                    Icons.lock_outline,
                                                    color: Colors.white,
                                                    size: Config
                                                            .safeBlockHorizontal *
                                                        7,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width:
                                            Config.safeBlockHorizontal * 50,
                                            margin: EdgeInsets.only(
                                                left: Config.safeBlockHorizontal * 5),
                                            padding: EdgeInsets.only(
                                              left: Config.safeBlockHorizontal * 2
                                            ),
                                            child: TextField(
                                              controller: password,
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
//                                                  fontFamily: 'Poppins',
                                                  fontSize:
                                                      Config.safeBlockVertical *
                                                          2.3,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                    color: Color(0xffD85053),
                                                    fontFamily: 'Poppins',
                                                    fontSize: Config
                                                            .safeBlockVertical *
                                                        2,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText: 'Password',
                                                  hintStyle: TextStyle(
//                                                    color: Color(0xffC8C9C9),
//                                                    fontFamily: 'Poppins',
                                                    fontSize: Config
                                                            .safeBlockVertical *
                                                        2,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
//                                                  labelText: 'Password'
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))),
                              SizedBox(
                                height: Config.safeBlockVertical * 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: Config.safeBlockHorizontal * 6,
                                    //4 of 6 parts in main container
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _rememberMe = !_rememberMe;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border:Border.all(
                                                      color: _rememberMe ?Colors.white : Color(0xffA8AAAC),
                                                      width: Config.safeBlockHorizontal*.3
                                                    ),
                                                    shape: BoxShape.circle,
                                                    color: _rememberMe ?Color(0xff00CCCC):Colors.white),
                                                child: _rememberMe
                                                    ? Icon(
                                                  Icons.check,
                                                  size: Config.safeBlockHorizontal*4,
                                                  color: Colors.white,
                                                )
                                                    : Icon(
                                                  Icons.check_box_outline_blank,
                                                  size: Config.safeBlockHorizontal*4,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: Config.safeBlockHorizontal *
                                                  1),
                                          child: Text(
                                            "Remember Me",
                                            style: TextStyle(
                                              color: Color(0xffA8AAAC),
//                                              fontFamily: 'Poppins',
                                              fontSize:
                                                  Config.safeBlockVertical *
                                                      1.7,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Color(0xffA8AAAC),
//                                        fontFamily: 'Poppins',
                                        fontSize:
                                            Config.safeBlockVertical * 1.7,
                                        fontWeight: FontWeight.normal,
                                        //  letterSpacing: Config.safeBlockHorizontal*.5
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Config.safeBlockVertical * 4,
                              ),
                              Container(
                                width: Config.safeBlockHorizontal * 100,
                                height: Config.safeBlockHorizontal * 12,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.2),
                                      spreadRadius: 1,
                                      blurRadius: 20,
                                      offset: Offset(
                                          -10, 10), //changes position of shadow
                                    ),
                                  ],
                                ),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Config.safeBlockHorizontal * 7)
                                  ),
                                  color: Color(0xff00CCCC),
                                  child: Center(
                                    child :Text(
                                      'Log In',
                                      style: TextStyle(
                                        color: Color(0xffffffff),
//                                        fontFamily: 'Poppins',
                                        fontSize:
                                        Config.safeBlockVertical * 2.2,
                                        fontWeight: FontWeight.normal,
                                        //  letterSpacing: Config.safeBlockHorizontal*.5
                                      ),
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: Config.safeBlockVertical * 4,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Don\'t have an account? ',
                                        style: TextStyle(
                                          color: Color(0xffA8AAAC),
//                                          fontFamily: 'Poppins',
                                          fontSize:
                                          Config.safeBlockVertical * 2.2,
                                          fontWeight: FontWeight.normal,
                                          //  letterSpacing: Config.safeBlockHorizontal*.5
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign Up Now',
                                        recognizer: TapGestureRecognizer()..onTap= () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())),
                                        style: TextStyle(
                                          color: Color(0xff3D73DD),
//                                          fontFamily: 'Poppins',
                                          fontSize:
                                          Config.safeBlockVertical * 2.2,
                                          fontWeight: FontWeight.normal,
                                          //  letterSpacing: Config.safeBlockHorizontal*.5
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Config.safeBlockVertical * 6,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width: Config.safeBlockHorizontal*80,
                                  child: Text(
                                    'By signing up you indicate that you have read and agreed to the Patch Terms of Service',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff285981),
//                                      fontFamily: 'Poppins',
                                      fontSize:
                                      Config.safeBlockVertical * 1.7,
                                      fontWeight: FontWeight.normal,
                                      //  letterSpacing: Config.safeBlockHorizontal*.5
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
