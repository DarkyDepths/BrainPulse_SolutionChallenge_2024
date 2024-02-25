import 'package:brain_pulse/Features/Authentication/bloc/auth_bloc.dart';
import 'package:brain_pulse/Features/ChatBot/pages/new_conversation.dart';
import 'package:brain_pulse/Features/Intro/cubit/introduction_page_index_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/bloc/health_goal_bloc.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/age_page_controller_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/assessement_page_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/gender_selection_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/pages/age_page.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/pages/gender_selection_page.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/pages/health_goal_page.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/pages/weight_page.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:brain_pulse/Transition/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const List<Widget> pages = [
  HealthGoalPage(),
  GenderPage(),
  AgeSelectionPage(),
  WeightPage(),
];

class MentalHealthAssessement extends StatelessWidget {
  const MentalHealthAssessement({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AssessementPageCubit(),
        ),
        BlocProvider(
          create: (context) => HealthGoalBloc(),
        ),
        BlocProvider(create: (context) => GenderSelectionCubit()),
        BlocProvider(create: (context) => AgePageControolerCubit()),
      ],
      child: BlocBuilder<AssessementPageCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.marron,
            body: SafeArea(
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller:
                      context.read<AssessementPageCubit>().pageController,
                  onPageChanged: (page) {
                    print("Changeeed to $page");
                    context.read<AssessementPageCubit>().setPage(page);
                  },
                  children: pages),
            ),
          );
        },
      ),
    );
  }
}

class AssesssementPage extends StatelessWidget {
  final Widget content;
  const AssesssementPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          MyAppBar(
            onTap: () {
              final assessementPageCubit = context.read<AssessementPageCubit>();
              assessementPageCubit.state == 0
                  ? context.read<AuthBloc>().add(SignOut())
                  : assessementPageCubit
                      .setPage(assessementPageCubit.state - 1);
            },
            title: "Assessement",
            action: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.marronSecondary),
              child: Center(
                child: Text(
                  "${context.read<AssessementPageCubit>().state + 1} OF 14",
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: const Color(0xFFC0A091),
                  ),
                ),
              ),
            ),
          ),
          const Gap(48),
          Expanded(child: content),
          MainButton(
            text: "Continue",
            iconPath: "assets/images/arrow_forword.png",
            color: AppColors.marronSecondary,
            onPressed: () {
              final assessementPageCubit = context.read<AssessementPageCubit>();
              assessementPageCubit.state == 3
                  ? Navigator.of(context).push(
                      FadePageRoute(child: const NewConversationChatBot()))
                  : assessementPageCubit
                      .setPage(assessementPageCubit.state + 1);
            },
          ),
          const Gap(30)
        ],
      ),
    );
  }
}
