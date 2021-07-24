import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/screens/sign_in/facebook_btn.dart';
import 'package:explore_hacks_2021/screens/sign_in/google_btn.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/sign-in-top.svg',
              semanticsLabel: 'login-svg',
              width: size.width,
            ),
            Column(
              children: [
                Column(
                  children: [
                    // logo
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(top: size.height * 0.5 - 170),
                      decoration: BoxDecoration(
                          color: ColorPalette.purple150,
                          shape: BoxShape.circle),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'App Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 30),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.08),
                Column(
                  children: [
                    GoogleBtn(),
                    SizedBox(height: 28),
                    FacebookBtn(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
