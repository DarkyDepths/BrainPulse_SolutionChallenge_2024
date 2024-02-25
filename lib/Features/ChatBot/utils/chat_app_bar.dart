import 'package:brain_pulse/Global/popup.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      decoration: const BoxDecoration(
        color: AppColors.marron4,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyIconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: AppColors.marron,
              icon: Image.asset(
                "assets/images/back_arrow.png",
                height: 24,
                width: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Doctor Freud.AI",
                  style: AppFonts.mainButtonsFont.copyWith(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "251 Chats Left",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    const Gap(8),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff5A554E)),
                    ),
                    const Gap(8),
                    Text(
                      "GPT-6",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                MyIconButton(
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: ((context) => const Popup(
                    //         content: ExerciceCompletedPopupContent())));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.lightGrey,
                    size: 24,
                  ),
                ),
                MyIconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/menu.png",
                      height: 24,
                      width: 24,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(124);
}

class MyIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget icon;
  final Function() onPressed;

  const MyIconButton({
    super.key,
    this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: backgroundColor == null
                ? Border.all(width: 1, color: AppColors.lightGrey)
                : null,
          ),
          child: icon),
    );
  }
}
