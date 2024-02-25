import 'package:brain_pulse/Features/Intro/cubit/introduction_page_index_cubit.dart';
import 'package:brain_pulse/Features/Intro/get_started.dart';
import 'package:brain_pulse/Features/Intro/utils/clipper..dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class _IntroductionPage extends StatelessWidget {
  final String imagePath;
  final int stepNumber;
  final Widget textWidget;
  const _IntroductionPage(
      {super.key,
      required this.imagePath,
      required this.stepNumber,
      required this.textWidget});

  @override
  Widget build(BuildContext context) {
    int pageNumber = context.watch<PageCubit>().state;
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: CurvedTopClipper(),
            child: Container(
              padding: const EdgeInsets.only(top: 80),
              height: 45.h,
              width: 100.w,
              color: AppColors.marron,
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Center(
                      child: Text(
                        "STEP $stepNumber",
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.1),
                      ),
                    ),
                  ),
                  const Gap(24),
                  textWidget,
                  const Gap(24),
                  TextButton(
                    onPressed: () {
                      context
                          .read<PageCubit>()
                          .setPage(context.read<PageCubit>().state + 1,context);
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xff4F3422),
                      child: Center(
                          child: Image.asset(
                        "assets/images/arrow_forword.png",
                        height: 40,
                        width: 50,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Steps extends StatelessWidget {
  const Steps({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _IntroductionPage(
        imagePath: "assets/images/feat1.png",
        stepNumber: 1,
        textWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Personalize Your Mental\n",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "Health State ",
                style: GoogleFonts.urbanist(
                    color: AppColors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "With AI",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      _IntroductionPage(
        imagePath: "assets/images/feat2.png",
        stepNumber: 2,
        textWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Intelligent ",
                style: GoogleFonts.urbanist(
                    color: AppColors.orange,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "Mood Tracking\n& Emotion Insights",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      _IntroductionPage(
        imagePath: "assets/images/feat3.png",
        stepNumber: 3,
        textWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "AI ",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "Mental ",
                style: GoogleFonts.urbanist(
                    color: AppColors.grey,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "Journaling &\nAI Therapy Chatbot",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      _IntroductionPage(
        imagePath: "assets/images/feat4.png",
        stepNumber: 4,
        textWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "AI ",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "Ressources ",
                style: GoogleFonts.urbanist(
                    color: AppColors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "That\nAI Makes You Happy",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      _IntroductionPage(
        imagePath: "assets/images/feat5.png",
        stepNumber: 5,
        textWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Loving & Supportive\n",
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
              TextSpan(
                text: "Community",
                style: GoogleFonts.urbanist(
                    color: AppColors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.01),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ];
    return BlocProvider(
      create: (context) => PageCubit(),
      child: MaterialApp(
        home: Scaffold(
          body: BlocBuilder<PageCubit, int>(
            builder: (context, state) {
              return Stack(
                children: [
                  PageView(
                      scrollDirection: Axis.horizontal,
                      controller: context.read<PageCubit>().pageController,
                      onPageChanged: (page) {
                        print("Changeeed to $page");
                        context.read<PageCubit>().setPage(page,context);
                      },
                      children: pages),
                  Positioned(
                    top: 60,
                    child: SizedBox(
                      width: 100.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              5,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          5), // The padding value will be the border width
                                      decoration: BoxDecoration(
                                        color: index <=
                                                context.read<PageCubit>().state
                                            ? Colors.white
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),
                                  ))),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
