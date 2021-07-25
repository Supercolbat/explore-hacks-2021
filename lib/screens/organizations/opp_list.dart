import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:explore_hacks_2021/screens/organizations/opp_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OppList extends StatelessWidget {
  final List<dynamic> oppList;

  OppList(this.oppList);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: Future.wait(
            this.oppList.map((e) => e.get().then(((d) => d.data())))),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<dynamic> data = snapshot.data as List<dynamic>;
            var oppList = [];
            (data).forEach((element) {
              oppList.add(Opportunity(
                  address: element['address'],
                  availableSpots: element['availableSpots'],
                  date: (element['date'] as Timestamp).toDate(),
                  description: element['description'],
                  name: element['name'],
                  id: ''));
            });

            return Container(
                width: size.width,
                height: size.height * 0.68,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFF9E0FF),
                        offset: Offset(0, 0),
                        blurRadius: 10)
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: 37, left: size.width * 0.11),
                        child: Text(
                          "Volunteer Listings",
                          style: TextStyle(
                            fontFamily: 'Geometria',
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: 37,
                        ),
                        child: Column(
                          children: oppList.map((opp) => OppItem(opp)).toList(),
                        ),
                      )
                    ]));
          }
          return Container(
            width: size.width,
            height: size.height * 0.68,
            child: Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorPalette.purple150),
              ),
            ),
          );
        });
  }
}
