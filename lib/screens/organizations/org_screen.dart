import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/models/organization.dart';
import 'package:explore_hacks_2021/screens/add_opp/add_opp.dart';
import 'package:explore_hacks_2021/screens/organizations/opp_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrgScreen extends StatelessWidget {
  final Organization org;
  final Function goBack;

  OrgScreen({required this.org, required this.goBack});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => addOppScreen()));
        },
        child: Icon(Icons.add)
      ),
      body: Container(
          width: size.width,
          color: ColorPalette.purple50,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25, top: 35),
                    child: GestureDetector(
                      onTap: () => this.goBack(),
                      child: SvgPicture.asset(
                        'assets/images/left-arrow.svg',
                        width: 50,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, top: 20),
                    child: Text(
                      this.org.name,
                      style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, top: 15),
                    child: Text(
                      this.org.description,
                      style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(bottom: 0, child: OppList())
            ],
          )),
    );
  }
}
