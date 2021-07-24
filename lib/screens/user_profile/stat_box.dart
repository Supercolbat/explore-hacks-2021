import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  final String label;
  final String stat;

  StatBox({required this.label, required this.stat});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: 145,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorPalette.purple150, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              this.label,
              style: TextStyle(
                fontFamily: "Geometria",
                color: ColorPalette.grey150,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            this.stat,
            style: TextStyle(
              fontFamily: "Geometria",
              color: ColorPalette.purple200,
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
          )
        ],
      ),
    );
  }
}
