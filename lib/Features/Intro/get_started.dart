import 'package:brain_pulse/Features/Authentication/pages/login_page.dart';
import 'package:brain_pulse/Features/Intro/cubit/introduction_page_index_cubit.dart';
import 'package:brain_pulse/Features/Intro/step1_intro.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:brain_pulse/Transition/fade_transition.dart';
import 'package:brain_pulse/Transition/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: AppColors.marron,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: const Color(0xff4F3422),
                    child: Center(
                        child: Image.asset(
                      "assets/images/brainsvg.png",
                      height: 40,
                      width: 50,
                    )),
                  ),
                  // const Gap(28),
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Welcome to the ultimate\n",
                              style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.01)),
                          TextSpan(
                              text: "BrainPulse ",
                              style: GoogleFonts.urbanist(
                                  color: AppColors.marronSecondary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.01)),
                          TextSpan(
                              text: "Platform!",
                              style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.01)),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(16),
                      Text(
                        "Your mindful mental health AI companion for everyone, anywhere 🍃",
                        style: GoogleFonts.urbanist(
                            color: const Color(0xffE8DDD9),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.004),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // const Gap(32),
                  Flexible(child: Image.asset("assets/images/intro_robot.png")),
                  const Gap(10),
                  TextButton(
                    onPressed: () {
                      //TODO: on pressed
                      print("Get started pressed");
                      Navigator.of(context)
                          .push(SlidingPageRoute(child: const Steps()));
                    },
                    child: Container(
                      width: 185,
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.marronSecondary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.urbanist(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -0.004),
                          ),
                          const Gap(16),
                          Image.asset("assets/images/arrow_forword.png")
                        ],
                      ),
                    ),
                  ),
                  // const Gap(30),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(SlidingPageRoute(child: const AuthenticationCheck()));
                      },
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Already have an account?",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xffE8DDD9),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.002)),
                        TextSpan(
                            text: "Sign In.",
                            style: GoogleFonts.urbanist(
                                color: const Color(0xffED7E1C),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.002)),
                      ])))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
