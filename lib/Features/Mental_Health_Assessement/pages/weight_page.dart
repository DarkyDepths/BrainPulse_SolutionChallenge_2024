import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/weight_controller.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/weight_unit_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeightUnitCubit(),
        ),
        BlocProvider(
          create: (context) => WeightController(),
        ),
      ],
      child: BlocBuilder<WeightUnitCubit, Alignment>(
        builder: (context, weightUnitState) {
          return BlocBuilder<WeightController, double>(
            builder: (context, weightPageControllerState) {
              final weightControllerCubit = context.read<WeightController>();
              return AssesssementPage(
                content: Column(
                  children: [
                    Text(
                      "What's your weight?",
                      style: AppFonts.headLine,
                    ),
                    const Gap(48),
                    Stack(
                      children: [
                        Container(
                          width: 92.w,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1234),
                              color: const Color(0xdff372315)),
                          child: AnimatedAlign(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            alignment: weightUnitState,
                            child: Container(
                              width: 49.w,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(1234),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.orange.withOpacity(0.3),
                                      blurRadius: 0,
                                      offset: const Offset(0, 0),
                                      spreadRadius: 4,
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .read<WeightUnitCubit>()
                                        .selectWeight(0);
                                    context.read<WeightController>().goToPage(
                                        weightPageControllerState / 2);
                                  },
                                  child: Text(
                                    "kg",
                                    style: AppFonts.mainButtonsFont,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .read<WeightUnitCubit>()
                                        .selectWeight(1);
                                    context.read<WeightController>().goToPage(
                                        weightPageControllerState * 2);
                                  },
                                  child: Text(
                                    "lbs",
                                    style: AppFonts.mainButtonsFont,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Gap(64),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${weightPageControllerState % 1 == 0 ? weightPageControllerState.toInt().toString() : weightPageControllerState}",
                            style: AppFonts.headLine.copyWith(fontSize: 96),
                          ),
                          TextSpan(
                            text: weightUnitState == Alignment.centerLeft
                                ? "kg"
                                : "lbs",
                            style: GoogleFonts.urbanist(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffc9c7c5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          PageView.builder(
                            onPageChanged: (page) {
                              weightControllerCubit.setPage(page / 5);
                            },
                            scrollDirection: Axis.horizontal,
                            controller: weightControllerCubit.pageController,
                            itemCount: 2000,
                            itemBuilder: ((context, index) => Center(
                                  child: AnimatedBuilder(
                                    animation:
                                        weightControllerCubit.pageController,
                                    builder: (context, child) {
                                      final controller =
                                          weightControllerCubit.pageController;
                                      double value =
                                          controller.position.haveDimensions
                                              ? controller.page!.toDouble()
                                              : weightPageControllerState
                                                  .toDouble();

                                      return SizedBox(
                                        height: 118,
                                        child: index % 5 == 0
                                            ? Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  // const Gap(2),
                                                  Container(
                                                    height: 55,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1234),
                                                        color: const Color(
                                                            0xff5A554E)),
                                                  ),
                                                  // const Gap(19),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: FittedBox(
                                                        child: Text(
                                                      "${index ~/ 5}",
                                                      style: AppFonts
                                                          .mainButtonsFont
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .grey2,
                                                              fontSize: 10),
                                                    )),
                                                  )
                                                ],
                                              )
                                            : Center(
                                                child: Container(
                                                  height: 24,
                                                  width: 4,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1234),
                                                      color: const Color(
                                                          0xff5A554E)),
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                )),
                          ),
                          Positioned.fill(
                              child: Center(
                            child: AnimatedBuilder(
                              animation: weightControllerCubit.pageController,
                              builder: (context, _) => Transform.scale(
                                scale: weightControllerCubit.pageController
                                        .position.isScrollingNotifier.value
                                    ? 0.9
                                    : 1,
                                child: Container(
                                  height: 120,
                                  width: 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 223, 255, 116),
                                      borderRadius: BorderRadius.circular(1234),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 100,
                                            spreadRadius: 70,
                                            color: AppColors.marron
                                                .withOpacity(1)),
                                        BoxShadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 20,
                                            spreadRadius: 10,
                                            color: const Color.fromARGB(
                                                    255, 192, 250, 3)
                                                .withOpacity(0.3))
                                      ]),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
