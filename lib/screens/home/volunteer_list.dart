import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/models/opportunity.dart';
import 'package:explore_hacks_2021/screens/home/volunteer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class VolunteerList extends StatefulWidget {
  final List<Opportunity> oppList;

  _VolunteerListState createState() => _VolunteerListState();

  VolunteerList({required this.oppList});
}

class _VolunteerListState extends State<VolunteerList> {
  int _slideIndx = 0;

  final PanelController _panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (widget.oppList.length < 1) {
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
                color: Color(0xFFF9E0FF), offset: Offset(0, 0), blurRadius: 10)
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
              ],
            ),
          ],
        ),
      );
    }
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
}
