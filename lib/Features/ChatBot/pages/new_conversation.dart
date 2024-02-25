import 'package:brain_pulse/Features/ChatBot/bloc/message_bloc.dart';
import 'package:brain_pulse/Features/ChatBot/pages/chat_conversation.dart';
import 'package:brain_pulse/Features/ChatBot/pages/chat_conversation_2.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:brain_pulse/Transition/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NewConversationChatBot extends StatelessWidget {
  const NewConversationChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.marron,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyAppBar(
                    title: "Mindful AI Chatbot",
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Image.asset("assets/images/ai_chatbot_robot.png"),
                  Column(
                    children: [
                      Text(
                        'Talk to Doctor Freud AI',
                        style: AppFonts.headLine,
                      ),
                      const Gap(8),
                      Text(
                        "You have no AI conversations. Get your\n mind healthy by starting a new one",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                            color: const Color(0xffD6C2B8),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.003),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: MainButton(
                        color: AppColors.orange,
                        text: "New Conversation",
                        iconPath: "assets/images/add+.png",
                        onPressed: () {
                          //TODO:
                          print("new converstaion pressed");
                          Navigator.of(context).push(FadePageRoute(
                              child: BlocProvider(
                            create: (context) => MessageBloc(),
                            child: const ChatBotScreen(),
                          )));
                        }),
                  ),
                  
                ]),
          ),
        ));
  }
}
