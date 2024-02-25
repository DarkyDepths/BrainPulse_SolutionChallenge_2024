part of 'message_bloc.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessagesLoaded extends MessageState {
  final List<Message> messages;

  MessagesLoaded({required this.messages});
}

class MessageFailure extends MessageState {
  final String error;

  MessageFailure({required this.error});
}
