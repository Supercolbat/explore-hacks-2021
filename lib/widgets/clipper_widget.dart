import 'package:flutter/cupertino.dart';

class ClipperWidget extends CustomClipper<Path> {
  final List<Offset> points;
  ClipperWidget({required this.points});

  @override
  getClip(Size size) {
    final Path path = Path();
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
