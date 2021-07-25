import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:explore_hacks_2021/constants/colors.dart';

class GoogleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: size.width * 0.7,
        height: 50,
        decoration: BoxDecoration(
          color: ColorPalette.purple150,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 33,
            ),
            SvgPicture.asset(
              'assets/images/google_logo.svg',
              semanticsLabel: 'Google Logo',
              width: 27,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              'Continue with Google',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
