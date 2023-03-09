import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../Components/style.dart';
import 'StoreRegistered.dart';

class StoreExplore extends StatefulWidget {
  @override
  _StoreExploreState createState() => _StoreExploreState();
}

class _StoreExploreState extends State<StoreExplore> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseUser _user;
  List<bool> isSelected = [true, false];

  bool isSearched = false;
  bool searchBar = false;
  // var status;
  // var Documents;
  // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  // double latitude, longitude;
  // void getUser() async {
  //   _user = await _auth.currentUser();
  // }
  //
  // Geoflutterfire geo = Geoflutterfire();
  // StreamSubscription subscription;
  // _getdata() async {
    // await geolocator
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    //     .then((Position position) {
    //   latitude = position.latitude;
    //   longitude = position.longitude;
    //   print(latitude);
    //   print(longitude);
    // }).catchError((e) {
    //   print(e);
    // });
    // // Create a geoFirePoint
    // GeoFirePoint center = geo.point(latitude: latitude, longitude: longitude);

    // double radius = 1000;
    // String field = 'location';

    // List a = collectionReference.toList();
    // setState(() {
    //   Documents = a;
    // });
    // _updateMarkers(a);
  // }

//
//   void _updateMarkers(List<DocumentSnapshot> documentList) {
//     print(documentList);
//     setState(() {
//       Documents = documentList;
//     });
//     documentList.forEach((DocumentSnapshot document) {
//       GeoPoint pos = document.data['location']['geopoint'];
//       double distance = document.data['distance'];
//       print(document);
//       print(pos);
//       print(distance);
//       print(document.data['title']);
//     });
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();
    // status = _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfffe82a7),
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: searchBar
            ? TextField(
          decoration: kSearchFieldDecor,
          style: kInfoText.copyWith(color: Colors.white),
          cursorColor: Colors.white,
        )
            : Center(
          child: Text(
            'Store',
            style: kGenderSelected,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            setState(() {
              searchBar = false;
            });
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  searchBar = !searchBar;
                });
              },
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: FutureBuilder(
                    future: FirebaseFirestore.instance.collection('OnlineStore').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        List<Widget> usersList = [];
                        final allData = snapshot.data?.docs.map((doc) => doc.data()).toList();
                        allData?.forEach((element) {
                          usersList.add(StoreExploreView(
                                    name: element['name'],
                                    price: element['price'],
                                    contact: element['mobile'],
                                    image: element['image'],
                                    description: element['description']));
                        });
                        if (usersList.isEmpty) {
                          return Container(
                            child: Center(
                              child: Text(
                                '🙁 No Records Found',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey),
                              ),
                            ),
                          );
                        }
                        return ListView(
                          children: usersList,
                        );
                      }
                      return Container();
                    }),
              )
            ],
          )),
    );
  }
}
