import 'package:brain_pulse/Features/Mental_Health_Assessement/bloc/health_goal_bloc.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HealthGoalPage extends StatelessWidget {
  const HealthGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionItems = [
      SelectionItem(
          imagePath: "assets/images/heart.png", text: "I wanna reduce stress"),
      SelectionItem(
          imagePath: "assets/images/ai_therapy.png",
          text: "I wanna try AI Therapy"),
      SelectionItem(
          imagePath: "assets/images/flag.png",
          text: "I want to cope with trauma"),
      SelectionItem(
          imagePath: "assets/images/smile.png",
          text: "I want to be a better person"),
      SelectionItem(
          imagePath: "assets/images/just_trying_app.png",
          text: "Just trying out the app, mate!"),
    ];
    return BlocBuilder<HealthGoalBloc, HealthGoalState>(
      builder: (context, state) {
        return AssesssementPage(
            content: Column(
          children: [
            Text('What’s your health\ngoal today?',
                textAlign: TextAlign.center, style: AppFonts.headLine),
            const Gap(48),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 5; i++)
                    SelectHealthGoalItem(
                        selectionItem: selectionItems[i],
                        isSelected: context
                            .read<HealthGoalBloc>()
                            .state
                            .selectedGoals[i],
                        onTap: () {
                          context
                              .read<HealthGoalBloc>()
                              .add(ToggleSelectionEvent(i));
                        })
                ]

           
                ),
          ],
        ));
      },
    );
  }
}

class SelectionItem {
  final String imagePath;
  final String text;

  SelectionItem({required this.imagePath, required this.text});
}

class SelectHealthGoalItem extends StatefulWidget {
  bool isSelected;
  final SelectionItem selectionItem;
  final Function() onTap;
  SelectHealthGoalItem({
    super.key,
    this.isSelected = false,
    required this.selectionItem,
    required this.onTap,
  });

  @override
  State<SelectHealthGoalItem> createState() => _SelectHealthGoalItemState();
}

class _SelectHealthGoalItemState extends State<SelectHealthGoalItem> {
  @override
  Widget build(BuildContext context) {
    final color =
        widget.isSelected ? AppColors.green : AppColors.marronSecondary2;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: 90.w,
          height: 56,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
            boxShadow: widget.isSelected
                ? [
                    const BoxShadow(
                      color: Color(0x3F9BB068),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 4,
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.selectionItem.imagePath,
                color:
                    widget.isSelected ? Colors.white : const Color(0xff736B66),
              ),
              const Gap(10),
              Expanded(
                child: Text(
                  widget.selectionItem.text,
                  style: GoogleFonts.urbanist(
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: -0.003,
                      color: Colors.white),
                ),
              ),
              Container(
                // padding: const EdgeInsets.all(12),
                height: 20,
                width: 20,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    color: Colors.transparent),
                child: widget.isSelected
                    ? Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
