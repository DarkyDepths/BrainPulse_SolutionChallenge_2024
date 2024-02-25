import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class MainButton extends StatelessWidget {
  final Color color;
  final String text;
  final String iconPath;
  final Function() onPressed;
  const MainButton({
    super.key,
    required this.color,
    required this.text,
    required this.iconPath, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: 93.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: AppFonts.mainButtonsFont),
            const Gap(16),
            Image.asset(iconPath)
          ],
        ),
      ),
    );
  }
}