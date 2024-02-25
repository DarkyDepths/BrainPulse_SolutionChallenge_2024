import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/assessement_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final Widget? action;
  final Function() onTap;
  const MyAppBar({
    super.key,
    required this.title,
    this.action, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Border color
                width: 1, // Border width
              ),
            ),
            child: Image.asset("assets/images/back_arrow.png"),
          ),
        ),
        const Gap(15),
        Text(
          title,
          style: GoogleFonts.urbanist(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.005,
              color: Colors.white),
        ),
        const Spacer(),
        action ?? Container()
      ],
    );
  }
}
