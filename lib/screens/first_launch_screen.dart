import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:explore_hacks_2021/constants/colors.dart';

class FirstLaunchScreen extends StatefulWidget {
  @override
  _FirstLaunchScreenState createState() => _FirstLaunchScreenState();
}

class _FirstLaunchScreenState extends State<FirstLaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: SvgPicture.asset("assets/images/startup-bottom.svg",
                width: MediaQuery.of(context).size.width),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4 -
                30, // 1/4th down the screen
            child: CircleAvatar(
                backgroundColor: ColorPalette.purple200, radius: 60),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4 + 15,
            child: Text(
              "Explore Hacks App!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 32.0, right: 32.0),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFA12EE8)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Start",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
