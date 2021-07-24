import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(milliseconds: 500),
          child: Image(
            image: AssetImage("assets/images/logo.png"),
            width: 120,
            height: 120,
          ),
        ),
      ),
    );
  }
}
