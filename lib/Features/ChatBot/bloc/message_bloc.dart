import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Models/message_model.dart';
import 'package:http/http.dart' as http;
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final List<Message> _messages = [
    Message(
        isSentByUser: true,
        text:
            " Thank you, Doctor Freud. 🙏Your presnence make me happy :) You’re the best AI Therapy chatbot out there. 🏁",
        timestamp: DateTime.now().subtract(const Duration(days: 1))),
    Message(
        isSentByUser: false,
        text:
            "No worries, Shinomiya! I'm here to support you. We'll make progress together!! 👍",
        timestamp: DateTime.now()),
  ];
  MessageBloc()
      : super(MessagesLoaded(messages: [
          Message(
              isSentByUser: true,
              text:
                  " Thank you, Doctor Freud. 🙏Your presnence make me happy :) You’re the best AI Therapy chatbot out there. 🏁",
              timestamp: DateTime.now().subtract(const Duration(days: 1))),
          Message(
              isSentByUser: false,
              text:
                  "No worries, Shinomiya! I'm here to support you. We'll make progress together!! 👍",
              timestamp: DateTime.now()),
        ])) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
  }
  void _onLoadMessages(LoadMessages event, Emitter<MessageState> emit) {
    emit(MessagesLoaded(messages: _messages));
  }

  void _onSendMessage(SendMessage event, Emitter<MessageState> emit) async {
    _messages.add(event.message);
    emit(MessagesLoaded(messages: _messages));
    await sendChatbotRequest(event.message.text);
  }

  Future<void> sendChatbotRequest(String message) async {
    final url = Uri.parse(
        'https://givyboy-mental-health-chatbot.hf.space/--replicas/04p3w/predict');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer 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", // Use only if needed
      },
      body: json.encode({
        "inputs": [
          "Hello!!", // System Prompt (optional)
          "Hello!!", // Prompt
          [
            ["Hello!", null]
          ], // parameter_3 Chatbot component
          "google/gemma-7b", // Models Dropdown component
          1, // Seed Slider component
          0.01, // Temperature Slider component
          0, // Max new tokens Slider component
          0.01, // Top-P Slider component
          0.1, // Repetition Penalty Slider component
          3, // Chat Memory Number component
          "Hello!!", // Modify Prompt Format Textbox component
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data.toString());
    }
  }
}
