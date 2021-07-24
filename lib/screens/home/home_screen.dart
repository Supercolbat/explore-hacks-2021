import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: ColorPalette.purple50,
      child: Column(
        children: [
          Text(
            "Volunteering",
          ),
        ],
      ),
    );
  }
}
