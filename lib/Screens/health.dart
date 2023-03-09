import 'package:flutter/material.dart';
import 'package:untitled/Screens/dialog_flow.dart';

import '../Components/GridDashboard.dart';
// import 'package:csv/csv.dart';
// import 'package:flutter/services.dart' show rootBundle;

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffe82a7),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Image(
                  image: AssetImage('assets/images/sakhi.gif'),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  color: Color(0xffffde59),
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'नमस्कार! मैं आपकी सखी हूं। मैं यहां आपके सवालों में मदद करने के लिए हूं। बस \'चैट विथ सखी\' पर क्लिक करें',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Chat with Sakhi',
                    style: TextStyle(fontSize: 18),
                  ),
                  // color: Colors.blue[100],
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(18),
                  //     side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Sakhi()));
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                GridDashboard(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
