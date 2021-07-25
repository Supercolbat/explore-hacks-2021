import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'clipper_widget.dart';

class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final List<Color> gradientColors;

  WaveWidget(
      {required this.size,
      required this.yOffset,
      required this.gradientColors});

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 20000),
    )..addListener(() {
        wavePoints.clear();

        final double waveSpeed = animationController.value * 1080;
        final double fullSphere = animationController.value * Math.pi * 2;
        final double normalizer = Math.cos(fullSphere);
        final double waveWidth = Math.pi / 270;
        final double waveHeight = 50.0;

        for (int i = 0; i <= widget.size.width.toInt(); ++i) {
          double calc = Math.sin((waveSpeed - i) * waveWidth);

          wavePoints.add(
            Offset(
              i.toDouble(),
              calc * waveHeight * normalizer + widget.yOffset,
            ),
          );
        }
      });

    animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(points: wavePoints),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.gradientColors,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        );
      },
    );
  }
}
