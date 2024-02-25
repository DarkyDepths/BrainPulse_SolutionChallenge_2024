import 'package:brain_pulse/Features/ChatBot/bloc/message_bloc.dart';
import 'package:brain_pulse/Features/ChatBot/pages/chat_conversation.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:brain_pulse/Transition/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse('https://huggingface.co/spaces/wissemkarous/Agasa-For-Mental-Health'));
    return Scaffold(
        backgroundColor: AppColors.marron,
        body: SafeArea(child: WebViewWidget(controller: controller)));
  }
}
