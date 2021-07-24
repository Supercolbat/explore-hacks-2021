import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:explore_hacks_2021/constants/colors.dart';

class FacebookBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        width: size.width * 0.7,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.black54,
          ),
          boxShadow: [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 33,
            ),
            SvgPicture.asset(
              'assets/facebook_logo.svg',
              semanticsLabel: 'Logo',
              width: 27,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              'Continue with Facebook',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
