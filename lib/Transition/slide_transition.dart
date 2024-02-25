import 'package:flutter/material.dart';

class SlidingPageRoute extends PageRouteBuilder {
  final Widget child;
  SlidingPageRoute({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // Start from the left
        end: Offset.zero, // End at the center
      ).animate(
          animation), // Assuming 'animation' is your Animation<double> controller
      child: child, // Your widget here
    );
  }
}
