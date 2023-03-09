import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'homepage.dart';

class EnterMobile extends StatefulWidget {
  @override
  _EnterMobileState createState() => _EnterMobileState();
}

class _EnterMobileState extends State<EnterMobile> {

  @override
  void initState() {
    super.initState();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gmail Login',
      home: Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                try{
                  signInWithGoogle().then((value) => {
                  Navigator.of(context, rootNavigator: true)
                      .pushAndRemoveUntil(
                  MaterialPageRoute(
                  builder: (BuildContext context) {
                  return Homepage();
                  },
                  ),
                  (_) => false,
                  )
                  });
                } catch(e) {
                  print(e);
                }
              },
              color: Colors.red,
              height: 50,
              minWidth: 100,
              child: const Text(
                'Google Signin',
                style: TextStyle(
                    color: Colors.white
                ), // TextStyle
              ), // Text
            ), // MaterialButton
          ),
      ),
    );
  }
}
