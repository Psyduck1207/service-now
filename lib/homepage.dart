import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/health.dart';

import 'gmail_login.dart';
import 'Jobs/JobsHomePage.dart';
import 'Meetups/meetupsHomePage.dart';
import 'onlinestore/StoreHomePage.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        brightness: Brightness.light,
        backgroundColor: Color(0xffffde59),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: new Image.asset('assets/images/menu(2).png'),
            );
          },
        ),
      ),
      drawer: NavDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/b7/b0/87/b7b087bc2cf3b6280a39597fbf2b62c8.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                color: Color(0xffffde59),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 40),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/healthcare.png"),
                          title: Text('Health & Lifestyle'),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          subtitle: Text(''),
                          isThreeLine: true,
                          trailing: ElevatedButton(
                              child: Text('Go', style: TextStyle(color: Colors.black),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Health()),
                                );
                              }),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/calendar.png"),
                          title: Text('Meetups'),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          subtitle: Text(''),
                          isThreeLine: true,
                          trailing: ElevatedButton(
                              child: Text('Go', style: TextStyle(color: Colors.black),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MeetUpsHomePage()),
                                );
                              }),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/job.png"),
                          title: Text('Jobs'),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          subtitle: Text(''),
                          isThreeLine: true,
                          trailing: ElevatedButton(
                              child: Text('Go', style: TextStyle(color: Colors.black),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobsHomePage()),
                                );
                              }),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/shopping-cart.png"),
                          title: Text('Store'),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          subtitle: Text(''),
                          isThreeLine: true,
                          trailing: ElevatedButton(
                              child: Text('Go', style: TextStyle(color: Colors.black),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.black)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoreHomePage()),
                                );
                              }),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Image(
        //       image: AssetImage('assets/images/ww.png'),
        //     )
        //   ],
        // )
      ),
    );
  }
}

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.7, //20.0,
      child: Drawer(
        child: Container(
          color: Color(0xfffe82a7),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  alignment: Alignment.topCenter,
                  // child: Text(
                  //   'StreeCare',
                  //   style: GoogleFonts.abel(
                  //       textStyle:
                  //           TextStyle(color: Colors.black, fontSize: 30)),
                  // ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/hands.png'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.input),
                    title: Text('Welcome'),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user_rounded),
                    title: Text('Profile'),
                    // onTap: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Profile())),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SliderDialog())),
                  ),
                  ListTile(
                    leading: Icon(Icons.border_color),
                    title: Text('Feedback'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EnterMobile();
                          },
                        ),
                            (_) => false,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
