import 'package:explore_hacks_2021/models/past_work.dart';
import 'package:explore_hacks_2021/screens/user_profile/past_work_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PastWorksList extends StatelessWidget {
  PastWorksList(this.pwList);
  final List<PastWork> pwList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'Past Work',
              style: TextStyle(
                  fontFamily: "Geometria",
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              children: pwList.map((pw) => PastWorkItem(pw)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
