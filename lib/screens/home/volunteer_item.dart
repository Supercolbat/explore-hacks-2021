import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VolunteerItem extends StatefulWidget {
  final Opportunity opp;

  VolunteerItem(this.opp);
  VolunteerItemState createState() => VolunteerItemState();
}

class VolunteerItemState extends State<VolunteerItem> {
  bool signedUp = false;

  void userSignedUp() {
    String oppid = '/opportunities/${widget.opp.id}';
    var user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw new Error();
    }

    String uid = user.uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((data) => setState(() {
              signedUp = data["upcomingOpportunities"].toList().contains(oppid);
            }));
  }

  @override
  Widget build(BuildContext context) {
    userSignedUp();

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: 95,
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
                  widget.opp.name,
                  style: TextStyle(
                    fontFamily: "Geometria",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  widget.opp.description != ''
                      ? widget.opp.description
                      : "No description provided :(",
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
                          .format(widget.opp.date),
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
                if (signedUp) {
                  return;
                }

                String oppid = '/opportunities/${widget.opp.id}';
                var user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  throw new Error();
                }

                String uid = user.uid;
                var data = await FirebaseFirestore.instance
                    .collection("users")
                    .doc(uid)
                    .get();
                List<String> upcomingEvents = data["upcomingOpportunities"];
                upcomingEvents.add(oppid);

                FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .update({"upcomingOpportunities": upcomingEvents});

                showDialog(
                  context: context,
                  builder: (BuildContext context) => new AlertDialog(
                    title: const Text('Signup complete'),
                    content: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "You've signed up to volunteer for ${widget.opp.name}!"),
                      ],
                    ),
                    actions: <Widget>[
                      new TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: SvgPicture.asset(
                signedUp
                    ? 'assets/images/green_check_icon.svg'
                    : 'assets/images/plus_icon.svg',
                width: 20,
              ),
            ),
          ),
          //arrow goes here
        ],
      ),
    );
  }
}
