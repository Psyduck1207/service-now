import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Meetups/MeetUpBoard.dart';

import '../Components/style.dart';

//id , register , delete deleting as of now
class Explore2 extends StatefulWidget {
  Explore2({required this.data, required this.id});
  var data, id;

  @override
  _Explore2State createState() => _Explore2State();
}

class _Explore2State extends State<Explore2> {
  bool isPressed = false;
  bool delete = false;
  DateFormat formatter = DateFormat.yMd();
  var uid = FirebaseAuth.instance.currentUser?.uid;
  late bool register;

  IconData down = Icons.keyboard_arrow_down,up = Icons.keyboard_arrow_up;
  _register() async {
    FirebaseFirestore.instance.collection('MeetUps').doc(widget.id).update({
      'attendees': FieldValue.arrayUnion([uid])
    }).then((value) {
      Fluttertoast.showToast(
          msg: "Successfully Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        register = true;
      });
    });
  }
  _delete() async {
    FirebaseFirestore.instance.collection('MeetUps').doc(widget.id).delete().then((value){
      Fluttertoast.showToast(
          msg: "Successfully Deleted the event",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder:(context)=>Board()));
  }

  @override
  void initState() {
    // TODO: implement initState
    register = widget.data['attendees'].contains(uid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //DateTime recoverDate = widget.isRecovered?widget.recoverDate.toDate():DateTime.now();
    //  DateTime lastTested = widget.lastTested.toDate();
    // print(widget.data['title']);
    return Container(
        decoration: BoxDecoration(
          color: Color(0xfffce4ec),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: InkWell(
          onTap: (){
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${widget.data['title']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black,),textAlign: TextAlign.justify),
                      //Text('${widget.age} years ${widget.gender}',style: TextStyle(fontSize: 15,color: Color(0xff756d7f)),),
                      SizedBox(height: 8,),
                      Text('On ${widget.data['date']} At ${widget.data['time']}',style: kInfoText,),
                      SizedBox(height: 5,),
                      Text('Duration: ${widget.data['duration']}', style: kInfoText,)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      child: Icon(
                        isPressed?up:down,
                        size: 30,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible: isPressed,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text('Contact: ${widget.data['mobile']}', style: kInfoText,),
                            SizedBox(height: 5,),
                            Text('No of Seats: ${widget.data['seats']}', style: kInfoText,),
                            SizedBox(height: 5,),
                            Text('Location: ${widget.data['landmark']},${widget.data['city']},${widget.data['state']}', style: kInfoText,),
                            SizedBox(height: 5,),
                            Text('More Info:',style: kInfoText,),
                            SizedBox(height: 2,),
                            Text('${widget.data['description']}', style: kInfoText,),
                            SizedBox(height: 2,),
                            ElevatedButton(onPressed: ()async {
                              register ? null : _register();
                            }, child: register ? Text("Registered") : Text("Register"),
                            ),
                            Visibility(
                              visible: widget.data['posted_by'] == uid,
                              child: ElevatedButton(onPressed: ()async {
                                await  _delete();
                              }, child: Text("Delete"),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
