import 'package:flutter/material.dart';

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    var path = Path();
    path.moveTo(0, 80);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 80);
    path.quadraticBezierTo(w / 2, 0, 0, 80);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
