import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:explore_hacks_2021/screens/home/volunteer_list.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String tagQuery = '';
  List<Opportunity> oppListState = [];
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  _fetchData() {
    return _memoizer.runOnce(() async {
      var snapshot =
          await FirebaseFirestore.instance.collection('opportunities').get();
      return snapshot.docs
          .map((QueryDocumentSnapshot d) => new Opportunity(
                id: d.id,
                address: d.get("address").toString(),
                name: d.get("name").toString(),
                availableSpots: int.parse(d.get("availableSpots").toString()),
                description: d.get("description").toString(),
                date: d.get("date").toDate(),
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        color: ColorPalette.purple50,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, top: 40),
              child: Text(
                "Volunteering",
                style: TextStyle(
                  fontFamily: 'Geometria',
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                onChanged: (e) {
                  setState(() {
                    this.tagQuery = e;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search by tags',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorPalette.purple200, width: 1),
                  ),
                  suffixIcon: Icon(
                    LineIcons.search,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('opportunities')
                    .where('type', isEqualTo: tagQuery)
                    .get()
                    .then((snapshot) {
                  return snapshot.docs
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
                }),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    List<Opportunity> oppList =
                        snapshot.data as List<Opportunity>;

                    return VolunteerList(
                      oppList: oppList,
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
