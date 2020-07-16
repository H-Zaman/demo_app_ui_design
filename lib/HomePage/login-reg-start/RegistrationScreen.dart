import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FocusNode focusNode = FocusNode();
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  String hintTextFullName;
  String hintTextUserName;
  String hintTextPassword;
  String hintTextConfirmPassword;
  String hintTextEmailAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.hasFocus;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintTextFullName = '';
      } else {
        hintTextFullName = 'Annie Alexandra Molly';
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullName.dispose();
    userName.dispose();
    password.dispose();
    confirmPassword.dispose();
    email.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SafeArea(
      child: Scaffold(
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
              children: <Widget>[
                Container(
                  child: Text(
                    'Create new account',
                    style: TextStyle(
                      color: Color(0xffffffff),
//                      fontFamily: 'Poppins',
                      fontSize: Config.safeBlockVertical * 3.5,
                      fontWeight: FontWeight.w500,
                      //  letterSpacing: Config.safeBlockHorizontal*.5
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Please enter your details below',
                    style: TextStyle(
                      color: Color(0xffffffff),
//                      fontFamily: 'Poppins',
                      fontSize: Config.safeBlockVertical * 2,
                      fontWeight: FontWeight.normal,
                      //  letterSpacing: Config.safeBlockHorizontal*.5
                    ),
                  ),
                ),
                SizedBox(
                  height: Config.safeBlockHorizontal * 5,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(Config.safeBlockVertical*4),
                      margin:
                          EdgeInsets.only(top: Config.safeBlockHorizontal * 12),
                      width: Config.safeBlockHorizontal * 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Config.safeBlockHorizontal * 9),
                            topRight:
                                Radius.circular(Config.safeBlockHorizontal * 9),
                          ),
                          color: Color(0xffF9F9F9)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: Config.safeBlockHorizontal * 7,
                          ),
                          //FULL NAME----------------------------------------------------------
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(
                                    Config.safeBlockHorizontal * 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), //changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: fullName,
                                focusNode: focusNode,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Color(0xff000000),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.3,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.symmetric(
//                                        vertical:
//                                            Config.safeBlockHorizontal * 2),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              Config.safeBlockHorizontal * 6,
                                          right:
                                              Config.safeBlockHorizontal * 2),
                                      child: Icon(
                                        Icons.account_circle,
                                        color: Color(0xff00CCCC),
                                        size: Config.safeBlockHorizontal * 6,
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Color(0xffD85053),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
//                                      color: Color(0xffC8C9C9),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),

//                                    labelText: 'Full Name',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always),
                              )),
                          SizedBox(
                            height: Config.safeBlockHorizontal * 4,
                          ),

                          //USER NAME----------------------------------------------------------
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(
                                    Config.safeBlockHorizontal * 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), //changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: userName,
                                focusNode: focusNode,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Color(0xff000000),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.3,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.symmetric(
//                                        vertical:
//                                            Config.safeBlockHorizontal * 2),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                          Config.safeBlockHorizontal * 6,
                                          right:
                                          Config.safeBlockHorizontal * 2),
                                      child: Icon(
                                        Icons.person_outline,
                                        color: Color(0xff00CCCC),
                                        size: Config.safeBlockHorizontal * 6,
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Color(0xffD85053),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'User Name',
                                    hintStyle: TextStyle(
//                                      color: Color(0xffC8C9C9),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),

//                                    labelText: 'Full Name',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                              )),
                          SizedBox(
                            height: Config.safeBlockHorizontal * 4,
                          ),

                          //PASSWORD NAME----------------------------------------------------------
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(
                                    Config.safeBlockHorizontal * 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), //changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: password,
                                focusNode: focusNode,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Color(0xff000000),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.3,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.symmetric(
//                                        vertical:
//                                            Config.safeBlockHorizontal * 2),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                          Config.safeBlockHorizontal * 6,
                                          right:
                                          Config.safeBlockHorizontal * 2),
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: Color(0xff00CCCC),
                                        size: Config.safeBlockHorizontal * 6,
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Color(0xffD85053),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
//                                      color: Color(0xffC8C9C9),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),

//                                    labelText: 'Full Name',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                              )),
                          SizedBox(
                            height: Config.safeBlockHorizontal * 4,
                          ),

                          //CONFIRM PASSWORD NAME----------------------------------------------------------
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(
                                    Config.safeBlockHorizontal * 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), //changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: confirmPassword,
                                focusNode: focusNode,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Color(0xff000000),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.3,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.symmetric(
//                                        vertical:
//                                            Config.safeBlockHorizontal * 2),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                          Config.safeBlockHorizontal * 6,
                                          right:
                                          Config.safeBlockHorizontal * 2),
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: Color(0xff00CCCC),
                                        size: Config.safeBlockHorizontal * 6,
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Color(0xffD85053),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(
//                                      color: Color(0xffC8C9C9),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),

//                                    labelText: 'Full Name',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                              )),
                          SizedBox(
                            height: Config.safeBlockHorizontal * 4,
                          ),

                          //EMAIL ADDRESS NAME----------------------------------------------------------
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(
                                    Config.safeBlockHorizontal * 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), //changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: email,
                                focusNode: focusNode,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Color(0xff000000),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.3,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.symmetric(
//                                        vertical:
//                                            Config.safeBlockHorizontal * 2),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                          Config.safeBlockHorizontal * 6,
                                          right:
                                          Config.safeBlockHorizontal * 2),
                                      child: Icon(
                                        Icons.mail_outline,
                                        color: Color(0xff00CCCC),
                                        size: Config.safeBlockHorizontal * 6,
                                      ),
                                    ),
                                    errorStyle: TextStyle(
                                      color: Color(0xffD85053),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
//                                      color: Color(0xffC8C9C9),
//                                      fontFamily: 'Poppins',
                                      fontSize: Config.safeBlockVertical * 2,
                                      fontWeight: FontWeight.normal,
                                    ),

//                                    labelText: 'Full Name',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                              )),
                          SizedBox(
                            height: Config.safeBlockHorizontal * 8,
                          ),

                          //BUTTON----------------------------------------------------------
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
                                      Config.safeBlockHorizontal * 7)),
                              color: Color(0xff00CCCC),
                              child: Center(
                                child: Text(
                                  'Create A New Account',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.2,
                                    fontWeight: FontWeight.normal,
                                    //  letterSpacing: Config.safeBlockHorizontal*.5
                                  ),
                                ),
                              ),
                              //-------------------------------------------------------------------- //TODO validator
                              onPressed: () {
//                                Navigator.pushNamed(context, '/registration');
                              },
                            ),
                          ),

                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: Config.safeBlockHorizontal * 4,
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0, right: 20.0),
                                      child: Divider(
                                        color: Colors.black,
                                        height:
                                            Config.safeBlockHorizontal * 10,
                                      )),
                                ),
                                Text(
                                  "Or connect with",
                                  style: TextStyle(
                                    color: Color(0xff34415F),
//                                    fontFamily: 'Poppins',
                                    fontSize: Config.safeBlockVertical * 2.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: Divider(
                                        color: Colors.black,
                                        height:
                                            Config.safeBlockHorizontal * 10,
                                      )),
                                ),
                              ]),
                              SizedBox(
                                height: Config.safeBlockHorizontal * 1,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('asset/splash/google.png',
                                width: Config.safeBlockHorizontal*5,
                                height: Config.safeBlockHorizontal*5,),
                              SizedBox(
                                width: Config.safeBlockHorizontal * 5,
                              ),
                              Image.asset('asset/splash/facebook.png',
                                width: Config.safeBlockHorizontal*5,
                                height: Config.safeBlockHorizontal*5,),
                              SizedBox(
                                width: Config.safeBlockHorizontal * 5,
                              ),
                              Image.asset('asset/splash/twitter.png',
                                width: Config.safeBlockHorizontal*5,
                                height: Config.safeBlockHorizontal*5,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Config.safeBlockHorizontal * 100,
                      child: Container(
                        width: Config.safeBlockHorizontal * 22,
                        height: Config.safeBlockHorizontal * 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.4),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person_outline,
                          size: Config.safeBlockHorizontal * 12,
                          color: Color(0xff3D73DD),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
