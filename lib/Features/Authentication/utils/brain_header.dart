import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BrainHeader extends StatelessWidget {
  const BrainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BrainHeaderClipper(),
      child: Container(
        width: 100.w,
        height: 180,
        color: AppColors.green,
        child: Center(
            child: Image.asset(
          "assets/images/brainsvg.png",
          color: Colors.white,
        )),
      ),
    );
  }
}

class _BrainHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
