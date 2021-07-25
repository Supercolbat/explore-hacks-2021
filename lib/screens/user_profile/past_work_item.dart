import 'package:explore_hacks_2021/models/past_work.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PastWorkItem extends StatelessWidget {
  final PastWork pastWork;

  PastWorkItem(this.pastWork);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 85,
          maxHeight: 130,
          minWidth: size.width * 0.7,
          maxWidth: size.width * 0.7),
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 13),
              child: SvgPicture.asset(
                'assets/images/loc_marker.svg',
                width: 15,
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(left: 20, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.pastWork.name,
                    style: TextStyle(
                      fontFamily: "Geometria",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    this.pastWork.description,
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
                                .format(this.pastWork.date) +
                            " (${pastWork.hours} ${pastWork.hours == 1 ? 'hour' : 'hours'})",
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
              child: SvgPicture.asset(
                this.pastWork.attended
                    ? 'assets/images/green_check_icon.svg'
                    : 'assets/images/x_icon.svg',
                width: 20,
              ),
            ),
            //arrow goes here
          ],
        ),
      ),
    );
  }
}
