import 'package:explore_hacks_2021/screens/home/volunteer_list.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        color: ColorPalette.purple50,
        child: Stack(
          children: [
            Positioned(
              left: size.width * 0.12,
              top: size.height * 0.09,
              child: Text(
                "Volunteering",
                style: TextStyle(
                  fontFamily: 'Geometria',
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: VolunteerList(),
            ),
          ],
        ),
      ),
    );
  }
}
