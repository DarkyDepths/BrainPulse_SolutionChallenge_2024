import 'package:brain_pulse/Features/Courses/cubit/emoji_controller_cubit.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CourseDone extends StatelessWidget {
  const CourseDone({super.key});

  @override
  Widget build(BuildContext context) {
    final emojiList = ["very_sad", "sad", "neutral", "happy", "very_happy"];
    return BlocProvider(
      create: (context) => EmojiController(),
      child: CourseDoneUI(emojiList: emojiList),
    );
  }
}

class CourseDoneUI extends StatelessWidget {
  const CourseDoneUI({
    super.key,
    required this.emojiList,
  });

  final List<String> emojiList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.marron,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              MyAppBar(
                  title: "",
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              const Gap(20),
              Image.asset("assets/images/course_done.png"),
              const Gap(26),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Course Done!",
                    style: AppFonts.headLine,
                  ),
                  const Gap(8),
                  Text(
                    "Congrats! Do ou feel Enlightened now?",
                    style: AppFonts.medium
                        .copyWith(fontSize: 16, color: AppColors.lightGrey),
                  ),
                ],
              ),
              const Gap(30),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Rate this course!",
                    style: AppFonts.medium.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  const Gap(8),
                  Image.asset("assets/images/select_item.png"),
                ],
              ),
              BlocBuilder<EmojiController, int>(
                builder: (context, state) {
                  final emojiController = context.read<EmojiController>();
                  // final emojiList = emojiController.pages;
                  return Expanded(
                      child: PageView.builder(
                          onPageChanged: (value) {
                            emojiController.setEmogi(value);
                          },
                          controller: emojiController.pageController,
                          scrollDirection: Axis.horizontal,
                          // itemCount: 5,
                          itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                  "assets/images/${emojiList[index % 5]}.png"))));
                },
              ),
              MainButton(
                  color: AppColors.marronSecondary,
                  text: "Rate Session",
                  iconPath: "assets/images/add+.png",
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
