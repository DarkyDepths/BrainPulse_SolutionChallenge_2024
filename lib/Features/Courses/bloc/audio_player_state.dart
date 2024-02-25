// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'audio_player_bloc.dart';

@immutable
sealed class AudioPlayerState {}

final class AudioPlayerInitial extends AudioPlayerState {}

class AudioPlayerLoading extends AudioPlayerState {}



class AudioPlayerPlaying extends AudioPlayerState {
  final Duration totalDuration;
  final Duration position;
  AudioPlayerPlaying({
     this.totalDuration=Duration.zero,
     this.position=Duration.zero,
  });
}

class AudioPlayerPaused extends AudioPlayerState {}

class AudioPlayerStopped extends AudioPlayerState {}
