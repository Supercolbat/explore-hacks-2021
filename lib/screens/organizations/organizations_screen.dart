import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/models/organization.dart';
import 'package:explore_hacks_2021/screens/organizations/organizations_item.dart';
import 'package:flutter/material.dart';

class OrganizationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Organization> orgList = [
      Organization(
          name: 'name',
          description: 'description',
          opportunities: [],
          owners: [])
    ];

    return Scaffold(
      body: Container(
        width: size.width,
        color: ColorPalette.purple50,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.08),
              child: Column(
                children: [
                  Text(
                    'Your Organizations',
                    style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: size.width * 0.8,
                    child: Text(
                      'These are the organizations you manage! Thank you for making the world a better place',
                      style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: ColorPalette.grey150,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 90),
            Column(
              children: orgList.map((e) => OrganizationItem(e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
