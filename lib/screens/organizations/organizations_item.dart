import 'package:explore_hacks_2021/models/organization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrganizationItem extends StatelessWidget {
  final Organization org;

  OrganizationItem(this.org);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.8,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 5,
                offset: Offset(0, 2))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 35, top: 15),
              child: SvgPicture.asset(
                'assets/images/loc_marker.svg',
                width: 17,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Test Name',
                      style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      )),
                  Text(
                    "test descirption",
                    style: TextStyle(
                      fontFamily: "Geometria",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 85, top: 19),
              child: SvgPicture.asset(
                'assets/images/gear_icon.svg',
                width: 25,
              ),
            )
          ],
        ));
  }
}
