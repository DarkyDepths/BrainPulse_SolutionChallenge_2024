import 'package:brain_pulse/Features/ChatBot/utils/chat_app_bar.dart';
import 'package:brain_pulse/Models/message_model.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isSentByUser = message.isSentByUser;
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Directionality(
        textDirection: isSentByUser ? TextDirection.rtl : TextDirection.ltr,
        child: Align(
          alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
          child: ClipPath(
            clipper: isSentByUser ? _MessageClipper() : _ChatMessageClipper(),
            child: Container(
              color: isSentByUser
                  ? AppColors.marronSecondary
                  : AppColors.marronSecondary2,
      
              padding:
                  const EdgeInsets.only(bottom: 20, top: 8, left: 8, right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyIconButton(
                      backgroundColor: AppColors.marron4,
                      icon: Image.asset(
                        isSentByUser
                            ? "assets/images/user.png"
                            : "assets/images/menu.png",
                        height: 24,
                        width: 24,
                        color: isSentByUser
                            ? const Color(0xffC0A091)
                            : AppColors.marronSecondary,
                      ),
                      onPressed: () {
                        //TODO
                      }),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Flexible(
                      child: Text(
                        message.text,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: AppFonts.semiBold
                            .copyWith(
                                fontSize: 14, height: 1.4, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              // decoration: const BoxDecoration(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start by moving to the bottom left of the shape
    path.moveTo(size.width, size.height - 30);

    // Mirror each point by subtracting the original x values from the width
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width - 10, size.height, size.width - 13, size.height - 13);
    path.lineTo(30, size.height - 13); // Mirrored lineTo
    path.quadraticBezierTo(0, size.height - 13, 0,
        size.height - 43); // First control point mirrored
    path.lineTo(0,
        30); // Straight line to the top left, remains unchanged as it's a vertical line

    // Top left curve, mirrored
    path.quadraticBezierTo(0, 0, 30, 0);

    // Completing the top edge to the starting point, mirrored
    path.lineTo(size.width - 30, 0); // Mirrored lineTo
    path.quadraticBezierTo(
        size.width, 0, size.width, 30); // Last control point mirrored

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _ChatMessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start by moving to the bottom left of the shape
    path.moveTo(0, size.height - 30); // Adjusted based on the SVG's viewbox
    path.lineTo(0, size.height);
    path.quadraticBezierTo(10, size.height, 13, size.height - 13);
    path.lineTo(size.width - 30, size.height - 13);
    path.quadraticBezierTo(
        size.width, size.height - 13, size.width, size.height - 43);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width, 0, size.width - 30, 0);
    path.lineTo(30, 0);
    path.quadraticBezierTo(0, 0, 0, 30);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
