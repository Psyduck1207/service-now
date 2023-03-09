import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Jobs/JobsHomePage.dart';
import '../Screens/Family.dart';
import '../Screens/health.dart';
import '../Screens/videos.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Sanitation", img: "assets/images/safe.png", screen: ThirdScreen());

  Items item2 = new Items(
    title: "Family",
    img: "assets/images/family.png",
    screen: Family(),

  );
  Items item3 = new Items(
    title: "Malnutrition",
    img: "assets/images/information(1).png",
    screen: ThirdScreen(),
  );
  Items item4 = new Items(
    title: "Depression",
    img: "assets/images/sadness.png",
    screen: Family(),
  );
  Items item5 = new Items(
    title: "Breast Cancer",
    img: "assets/images/ribbon.png",
    screen: ThirdScreen(),
  );
  Items item6 = new Items(
    title: "Ask",
    img: "assets/images/conversation.png",
    screen: Family(),
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
    ];
    var color = 0xffffde59;
    return GridView.count(
        childAspectRatio: 1.0,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 14, right: 14),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: myList.map((data) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 60,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => data.screen),
            ),
          );
        }).toList());
  }
}

class Items {
  String title;
  String img;
  Widget screen;
  Items({required this.title, required this.img, required this.screen});
}
