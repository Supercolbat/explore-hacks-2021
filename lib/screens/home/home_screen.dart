import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:explore_hacks_2021/screens/home/volunteer_list.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var opp = FirebaseFirestore.instance.collection('opportunities');
    return FutureBuilder(
      future: opp.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          Size size = MediaQuery.of(context).size;

          List<Opportunity> oppList = (snapshot.data! as QuerySnapshot)
              .docs
              .map((QueryDocumentSnapshot d) => new Opportunity(
                    id: d.id,
                    address: d.get("address").toString(),
                    name: d.get("name").toString(),
                    availableSpots:
                        int.parse(d.get("availableSpots").toString()),
                    description: d.get("description").toString(),
                    date: d.get("date").toDate(),
                  ))
              .toList();

          return Scaffold(
            body: Container(
              width: size.width,
              color: ColorPalette.purple50,
              child: Stack(
                children: [
                  Positioned(
                    left: size.width * 0.12,
                    top: size.height * 0.09,
                    child: Text(
                      "Volunteering",
                      style: TextStyle(
                        fontFamily: 'Geometria',
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: VolunteerList(
                      oppList: oppList,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;

  //   return Scaffold(
  //     body: Container(
  //       width: size.width,
  //       color: ColorPalette.purple50,
  //       child: Stack(
  //         children: [
  //           Positioned(
  //             left: size.width * 0.12,
  //             top: size.height * 0.09,
  //             child: Text(
  //               "Volunteering",
  //               style: TextStyle(
  //                 fontFamily: 'Geometria',
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 23,
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             bottom: 0,
  //             child: VolunteerList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
