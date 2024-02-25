import 'package:brain_pulse/Features/Authentication/utils/brain_header.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate({super.key, required this.form, required this.title});
  final String title;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.marron,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Header
            const BrainHeader(),
            const Gap(40),
            //title
            Text(
              title,
              style: AppFonts.headLine,
            ),
            const Gap(40),
            Expanded(child: form)
          ],
        ),
      ),
    );
  }
}
