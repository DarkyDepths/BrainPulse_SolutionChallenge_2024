import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/assessement_page_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/cubit/gender_selection_cubit.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int?>(
      builder: (context, state) {
        final selectedIndex = context.read<GenderSelectionCubit>().state;
        return AssesssementPage(
            content: Column(
          children: [
            Text(
              "What's your offical\ngender?",
              style: AppFonts.headLine,
              textAlign: TextAlign.center,
            ),
            const Gap(40),
            _GenderCard(
              isSelected: selectedIndex == 0,
            ),
            const Gap(8),
            _GenderCard(
              isMale: false,
              isSelected: selectedIndex == 1,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                print("Prefer to skip, thanks pressed");
                final assessementPageCubit =
                    context.read<AssessementPageCubit>();
                assessementPageCubit.setPage(assessementPageCubit.state + 1);
              },
              child: Container(
                height: 56,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff3D4A26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Prefer to skip, thanks",
                        style: AppFonts.mainButtonsFont
                            .copyWith(color: const Color(0xff9BB168))),
                    const Gap(16),
                    Image.asset("assets/images/skip.png")
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}

class _GenderCard extends StatelessWidget {
  bool isSelected, isMale;

  _GenderCard({
    this.isMale = true,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<GenderSelectionCubit>().selectGender(isMale ? 0 : 1);
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        clipBehavior: Clip.antiAlias,
        width: 92.w,
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: const Color(0xff4F3422),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: isSelected
                  ? Border.all(
                      color: Colors.white,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside)
                  : null),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isMale ? "I am Male" : "I am Female",
                      style: AppFonts.mainButtonsFont,
                    ),
                    const Spacer(),
                    Image.asset(isMale
                        ? "assets/images/male_logo.png"
                        : "assets/images/female_logo.png")
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                isMale
                    ? "assets/images/male_gender.png"
                    : "assets/images/female_gender.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
