import 'package:flutter/cupertino.dart';

class ClipperWidget extends CustomClipper<Path> {
  final List<Offset> points;

  ClipperWidget({required this.points});

  @override
  getClip(Size size) {
    final Path path = Path();

    // Draws a line that traces the wave, to the bottom right corner of the screen, to bottom left corner of the screen
    // path.close joins the ends of the lines
    path.addPolygon(points, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
