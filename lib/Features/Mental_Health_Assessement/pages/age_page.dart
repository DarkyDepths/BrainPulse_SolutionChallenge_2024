import 'dart:math';

import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/age_page_controller_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/assessement_page_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeSelectionPage extends StatefulWidget {
  const AgeSelectionPage({super.key});

  @override
  State<AgeSelectionPage> createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AgePageControolerCubit>().init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AgePageControolerCubit>().pageController;
    return AssesssementPage(
      content: Column(
        children: [
          Text(
            "What's your age?",
            style: AppFonts.headLine,
          ),
          const Gap(20),
          Expanded(
            child: PageView.builder(
              onPageChanged: (page) {
                context.read<AgePageControolerCubit>().setPage(page);
              },
              scrollDirection: Axis.vertical,
              controller: controller,
              itemCount: 100,
              itemBuilder: ((context, index) => Center(
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        print(
                            "indeex $index  staatee : ${context.read<AgePageControolerCubit>().state}");

                        double value = 0;

                        value = controller.position.haveDimensions
                            ? (index.toDouble() - controller.page!).abs()
                            : (index.toDouble() -
                                context.read<AgePageControolerCubit>().state);

                        double scale = 1 - (value.abs() * 0.3).clamp(0.0, 1.0);
                        double minScale = 0.2;
                        scale = max(scale, minScale);
                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            width: 256,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: index ==
                                      context
                                          .read<AgePageControolerCubit>()
                                          .state
                                  ? const Color(0xFF9BB067)
                                  : null,
                              borderRadius: BorderRadius.circular(1234),
                              boxShadow: index ==
                                      context
                                          .read<AgePageControolerCubit>()
                                          .state
                                  ? const [
                                      BoxShadow(
                                        color: Color(0x3F9BB068),
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                        spreadRadius: 4,
                                      )
                                    ]
                                  : null,
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                "$index",
                                style: AppFonts.headLine.copyWith(
                                    fontSize: 128 * scale,
                                    color: Colors.white.withOpacity(scale)),
                              ),
                            ),
                          ),
                        );
                      }))),
            ),
          ),
          const Gap(20)
        ],
      ),
    );
  }
}
