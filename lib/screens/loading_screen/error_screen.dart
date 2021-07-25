import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
          Image(
            image: AssetImage("assets/images/logo.jpg"),
            width: 120,
            height: 120,
          ),
          Text(
            "Failed to load",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Geometria",
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
