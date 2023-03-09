import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/style.dart';
import 'MeetRegistered.dart';

class MeetupExplore extends StatefulWidget {
  @override
  _MeetupExploreState createState() => _MeetupExploreState();
}

class _MeetupExploreState extends State<MeetupExplore> {
  List<bool> isSelected = [true, false];
  var uid = FirebaseAuth.instance.currentUser?.uid;
  bool isSearched = false;
  bool searchBar = false;
  var status;
  var Documents;
  // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  // double latitude, longitude;
  // void getUser() async {
  //   _user = await _auth.currentUser();
  // }

  // Geoflutterfire geo = Geoflutterfire();
  // StreamSubscription subscription;
  // _getdata() async {
  //   await geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //     print(latitude);
  //     print(longitude);
  //   }).catchError((e) {
  //     print(e);
  //   });
  //   // Create a geoFirePoint
  //   GeoFirePoint center = geo.point(latitude: latitude, longitude: longitude);

// get the collection reference or query
//     var collectionReference = FirebaseFirestore.instance.collection('MeetUps');

    //double radius = 50;
    //String field = 'location';

    // subscription = await geo
    //     .collection(collectionRef: collectionReference)
    //     .within(center: center, radius: radius, field: field)
    //     .listen(_updateMarkers);
    // return subscription;
  //}

  // void _updateMarkers(List<DocumentSnapshot> documentList) {
  //   print(documentList);
  //   setState(() {
  //     Documents = documentList;
  //   });
  //   documentList.forEach((DocumentSnapshot document) {
  //     GeoPoint pos = document.data['location']['geopoint'];
  //     double distance = document.data['distance'];
  //     print(document);
  //     print(pos);
  //     print(distance);
  //     print(document.data['title']);
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
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
            'MeetUps',
            style: kGenderSelected,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              searchBar = false;
            });
            // if(isSearched)
            // {
            //   setState(() {
            //     screens[1] = BoardPage(searchedQuery: '',);
            //   });
            // }
            // else
            // {
            //
            // }
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
                    future: FirebaseFirestore.instance.collection('MeetUps').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        List<Widget> usersList = [];
                        final allData = snapshot.data?.docs.map((doc) => doc.data()).toList();
                        final allIds = snapshot.data?.docs.map((doc) => doc.id).toList();
                        int? len = allData?.length;
                        for(int i=0; i< len!;i++){
                          usersList.add(ExploreView(
                                  title: allData![i]['title'],
                                  city: allData![i]['city'],
                                  description: allData![i]['description'],
                                  date: allData![i]['date'],
                                  landmark: allData![i]['landmark'],
                                  mobile: allData![i]['mobile'],
                                  seats: allData![i]['seats'],
                                  state: allData![i]['state'],
                                  duration: allData![i]['duration'],
                                  time: allData![i]['time'],
                                  postedBy: allData![i]['posted_by'],id: allIds![i], register: allData![i]['attendees'].contains(uid),
                          )
                              );
                        }
                        // print(allData);
                        // allData?.forEach((element) {
                        //   usersList.add(ExploreView(
                        //       title: element['title'],
                        //       city: element['city'],
                        //       description: element['description'],
                        //       date: element['date'],
                        //       landmark: element['landmark'],
                        //       mobile: element['mobile'],
                        //       seats: element['seats'],
                        //       state: element['state'],
                        //       duration: element['duration'],
                        //       time: element['time'],
                        //       postedBy: element['posted_by'], id: '',)
                        //   );
                        // });
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
