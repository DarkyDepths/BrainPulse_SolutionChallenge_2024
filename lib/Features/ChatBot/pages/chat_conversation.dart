import 'package:brain_pulse/Features/ChatBot/bloc/message_bloc.dart';
import 'package:brain_pulse/Features/ChatBot/utils/chat_app_bar.dart';
import 'package:brain_pulse/Models/message_model.dart';
import 'package:brain_pulse/Models/message_widget_model.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      backgroundColor: AppColors.marron,
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state) {
                int lastDay = 0;
                bool showMessageDate = false;
                if (state is MessagesLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 25),
                    child: ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        if (lastDay == 0 || lastDay != message.timestamp.day) {
                          lastDay = message.timestamp.day;
                          showMessageDate = true;
                        } else {
                          showMessageDate = false;
                        }

                        int diffrenece =
                            DateTime.now().difference(message.timestamp).inDays;
                      
                        String messageDay;
                        switch (diffrenece) {
                          case 0:
                            messageDay = "Today";
                            break;
                          case 1:
                            messageDay = "Yesterday";
                            break;
                          default:
                            messageDay =
                                "${message.timestamp.day}/${message.timestamp.month}";
                        }

                        return showMessageDate
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 1,
                                        width: 35.w,
                                        color: const Color(0xffD6C2B8),
                                      ),
                                      Text(
                                        messageDay,
                                        style: GoogleFonts.urbanist(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: -0.002,
                                            color: AppColors.marronSecondary),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 35.w,
                                        color: const Color(0xffD6C2B8),
                                      ),
                                    ],
                                  ),
                                  const Gap(5),
                                  MessageWidget(message: message),
                                ],
                              )
                            : MessageWidget(message: message);
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Container(
            height: 110,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppColors.marron4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 280,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.marron,
                      borderRadius: BorderRadius.circular(1234)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mic,
                        color: AppColors.marronSecondary,
                      ),
                      const Gap(10),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: AppFonts.semiBold
                                  .copyWith(fontSize: 14, color: Colors.white),
                              hintText: "Type to start chatting..."),
                          style: AppFonts.semiBold
                              .copyWith(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Image.asset("assets/images/camera.png")
                    ],
                  ),
                ),
                MyIconButton(
                    onPressed: () {
                      context.read<MessageBloc>().add(SendMessage(
                          message: Message(
                              text: _controller.text,
                              timestamp: DateTime.now(),
                              isSentByUser: true)));
                      FocusScope.of(context).unfocus();
                      _controller.clear();
                 
                    },
                    backgroundColor: AppColors.green,
                    icon: Image.asset(
                      "assets/images/enter_arrow.png",
                      height: 24,
                      width: 24,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
