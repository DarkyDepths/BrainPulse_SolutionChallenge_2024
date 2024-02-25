import 'package:brain_pulse/Features/ChatBot/utils/chat_app_bar.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class Popup extends StatelessWidget {
  final Widget content;
  const Popup({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 17),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        width: 95.w,
        constraints: BoxConstraints(minHeight: 65.h),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.marron,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 1, color: AppColors.marronSecondary)),
        child: content,
      ),
    );
  }
}

class ExerciceCompletedPopupContent extends StatelessWidget {
  const ExerciceCompletedPopupContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/exercice_completed.png',
          width: 90.w, // Replace with your asset image
        ),
        const SizedBox(height: 20),
        const Text(
          'Exercise Completed!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/images/solid_menu.png'),
                  color: AppColors.green,
                ),
                const Gap(3),
                Text(
                  '+8 Freud Score',
                  style: AppFonts.bold
                      .copyWith(color: AppColors.lightGrey, fontSize: 16),
                ),
              ],
            ),
            const Gap(24),
            Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/images/solid_mood_neutral.png'),
                  color: AppColors.marronSecondary,
                ),
                const Gap(3),
                Text(
                  '-1 Stress Level',
                  style: AppFonts.medium
                      .copyWith(color: AppColors.lightGrey, fontSize: 16),
                ),
              ],
            )
          ],
        ),
        const Gap(12),
        Text(
          'Your mental health is improving, congratulations!! 🎉',
          textAlign: TextAlign.center,
          style: AppFonts.medium
              .copyWith(color: AppColors.lightGrey, fontSize: 18),
        ),
       const Gap(32),
        Align(
          alignment: Alignment.bottomCenter,
          child: MainButton(
              color: AppColors.marronSecondary,
              text: "Got it, thanks!",
              iconPath: "assets/images/tick.png",
              onPressed: () {
                Navigator.of(context).pop();
              }),
        )
      ],
    );
  }
}
