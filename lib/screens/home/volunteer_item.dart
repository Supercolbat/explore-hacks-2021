import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VolunteerItem extends StatelessWidget {
  final Opportunity opp;

  VolunteerItem(this.opp);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: 85,
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 5)
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 13),
            child: SvgPicture.asset(
              'assets/images/loc_marker.svg',
              width: 20,
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(left: 20, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.opp.name,
                  style: TextStyle(
                    fontFamily: "Geometria",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  this.opp.description,
                  style: TextStyle(
                    fontFamily: "Geometria",
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/calendar.svg',
                      width: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      DateFormat(DateFormat.ABBR_MONTH_DAY)
                          .format(this.opp.date),
                      style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: InkWell(
            onTap: () async {
              String oppid = '/opportunities/${this.opp.doc.id}';
              var user = FirebaseAuth.instance.currentUser;
              if (user == null) {
                throw new Error();
              }
              String uid = user.uid;
              var data = await FirebaseFirestore.instance.collection('users').doc(uid).get();
              List<dynamic> upcoming_events = data["upcomingOpportunities"];
              upcoming_events.add(oppid);
              FirebaseFirestore.instance.collection('users').doc(uid).update(
                {"upcomingOpportunities": upcoming_events}
              );
            },
            child: SvgPicture.asset(
              'assets/images/plus_icon.svg',
              width: 20,
            ),
          )
          ),
          //arrow goes here
        ],
      ),
    );
  }
}
