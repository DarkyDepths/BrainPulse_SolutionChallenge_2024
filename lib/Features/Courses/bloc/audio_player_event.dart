part of 'audio_player_bloc.dart';

@immutable
sealed class AudioPlayerEvent {}

class PlayAudioEvent extends AudioPlayerEvent {}

class PauseAudioEvent extends AudioPlayerEvent {}

class StopAudioEvent extends AudioPlayerEvent {}

class ResumeAudioEvent extends AudioPlayerEvent {}
class RestartAudioEvent extends AudioPlayerEvent {}

class ProgressAudioEvent extends AudioPlayerEvent {
  final Duration position;
  final Duration totalDuration;

  ProgressAudioEvent(
      {this.position = Duration.zero, this.totalDuration = Duration.zero});
}
