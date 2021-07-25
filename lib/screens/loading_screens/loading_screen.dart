import 'package:flutter/material.dart';
import 'dart:math' as Math;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    rotateAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticInOut,
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

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
          RotationTransition(
            turns: rotateAnimation,
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
