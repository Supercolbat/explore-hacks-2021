import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:explore_hacks_2021/screens/home/volunteer_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class VolunteerList extends StatefulWidget {
  final List<Opportunity> oppList;

  _VolunteerListState createState() => _VolunteerListState();

  VolunteerList({required this.oppList});
}

class _VolunteerListState extends State<VolunteerList> {
  int _slideIndx = 1;

  final PanelController _panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.68,
      child: SlidingUpPanel(
        controller: this._panelController,
        minHeight: 0,
        maxHeight: size.height * 0.5,
        defaultPanelState: PanelState.CLOSED,
        color: ColorPalette.purple50,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        panel: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 28),
                child: Text(
                  widget.oppList[_slideIndx].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Geometria", fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  widget.oppList[_slideIndx].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Geometria",
                      fontSize: 14,
                      color: ColorPalette.grey150),
                ),
              )
            ],
          ),
        ),
        body: Container(
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 37, left: size.width * 0.11),
                    child: Text(
                      "Opportunities near you",
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
                      children: widget.oppList
                          .asMap()
                          .entries
                          .map((e) => VolunteerItem(e.value, () {
                                setState(() {
                                  _slideIndx = e.key;
                                });
                                if (this._panelController.isAttached) {
                                  this._panelController.open();
                                }
                              }))
                          .toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   var opp = FirebaseFirestore.instance.collection('opportunities');
  //   return FutureBuilder(
  //       future: opp.get(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done &&
  //             snapshot.hasData) {
  //           Size size = MediaQuery.of(context).size;

  //           List<Opportunity> oppList = (snapshot.data! as QuerySnapshot)
  //               .docs
  //               .map((QueryDocumentSnapshot d) => new Opportunity(
  //                     id: d.id,
  //                     address: d.get("address").toString(),
  //                     name: d.get("name").toString(),
  //                     availableSpots:
  //                         int.parse(d.get("availableSpots").toString()),
  //                     description: d.get("description").toString(),
  //                     date: d.get("date").toDate(),
  //                   ))
  //               .toList();
  //           /*
  //             new Opportunity(
  //                 address: '1600 Pennsylvania Ave NW, Washington, DC',
  //                 avaiableSpots: 25,
  //                 date: DateTime(2021, 10, 14),
  //                 description: 'Let\'s all clean dogs together',
  //                 name: 'Dog grooming convention',
  //                 organization: '123'),
  //             new Opportunity(
  //                 address: '8845 Long Road',
  //                 avaiableSpots: 157,
  //                 date: DateTime(2021, 7, 29),
  //                 description: 'Help make meals for schools',
  //                 name: 'Houston Food Bank',
  //                 organization: '123'),
  //             new Opportunity(
  //                 address: '4458 Yellow Brick Ln.',
  //                 avaiableSpots: 5,
  //                 date: DateTime(2021, 8, 7),
  //                 description: 'Pick up trash',
  //                 name: 'Clean up the beach',
  //                 organization: '123')
  //           ];*/
  //           return Container(
  //             width: size.width,
  //             height: size.height * 0.68,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(40),
  //                 topRight: Radius.circular(40),
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Color(0xFFF9E0FF),
  //                     offset: Offset(0, 0),
  //                     blurRadius: 10)
  //               ],
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   margin: EdgeInsets.only(top: 37, left: size.width * 0.11),
  //                   child: Text(
  //                     "Opportunities near you",
  //                     style: TextStyle(
  //                       fontFamily: 'Geometria',
  //                       fontWeight: FontWeight.w400,
  //                       fontSize: 17,
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   alignment: Alignment.center,
  //                   margin: EdgeInsets.only(
  //                     top: 37,
  //                   ),
  //                   child: Column(
  //                     children:
  //                         oppList.map((opp) => VolunteerItem(opp)).toList(),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //         }
  //         return Center(
  //             child: CircularProgressIndicator(
  //           valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.purple150),
  //         ));
  //       });
  // }
}
