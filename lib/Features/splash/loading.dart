import 'package:brain_pulse/Features/Intro/get_started.dart';
import 'package:brain_pulse/Features/Intro/step1_intro.dart';
import 'package:brain_pulse/Features/splash/cubit/page_index_cubit.dart';
import 'package:brain_pulse/Features/splash/cubit/progress_cubit.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:brain_pulse/Transition/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgressCubit>().startProgress();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressCubit, int>(
      builder: (context, state) {
        if (state == 100) {
          Future.delayed(
              const Duration(milliseconds: 500),
              () => Navigator.of(context)
                  .push(FadePageRoute(child: const _Loading2())));
        }
        return Scaffold(
          body: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background_blue2.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Loading',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          height: 1,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.012,
                        ),
                      ),
                    ),
                    Lottie.asset("assets/animated_icons/three_dots2.json")
                  ],
                ),
                const Gap(25),
                Text(
                  '$state %',
                  style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 0.04,
                      letterSpacing: -0.30,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Loading2 extends StatelessWidget {
  const _Loading2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(FadePageRoute(child: const _Loading3()));
    });

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: 100.h,
        width: 100.w,
        color: AppColors.orange,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/brainsvg.png"),
              const SizedBox(
                height: 47,
              ),
              Text(
                "In the mindset of\nwinter, I found there\nwas within me an\ninvincible summer",
                style: GoogleFonts.urbanist(
                    fontSize: 31.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.012),
              ),
              const SizedBox(
                height: 64,
              ),
              Text(
                "— ALBERT CAMUS",
                style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.1),
              ),
            ]),
      ),
    );
  }
}

class _Loading3 extends StatelessWidget {
  const _Loading3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(FadePageRoute(child: const GetStartedPage()));
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/looading3_background.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Fetching Data',
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    height: 1,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.012,
                  ),
                ),
              ),
              Lottie.asset("assets/animated_icons/three_dots2.json")
            ],
          ),
        ),
      ),
    );
  }
}
