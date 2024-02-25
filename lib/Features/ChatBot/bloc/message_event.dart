part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}

class LoadMessages extends MessageEvent {}

class SendMessage extends MessageEvent {
  final Message message;

  SendMessage({required this.message});
}
