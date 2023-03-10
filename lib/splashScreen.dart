import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/homepage.dart';

import 'gmail_login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      getstatus();
    });
  }

  void getstatus() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EnterMobile()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xfffe82a7),
                  Color(0xfffe82a7),
                ])),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: Image.asset("assets/images/ruralwomen.png"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
