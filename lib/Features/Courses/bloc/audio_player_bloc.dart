// import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:meta/meta.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final player = AudioPlayer();
  Duration? position = Duration.zero;

  Duration? totalDuration = Duration.zero;
  StreamSubscription<Duration>? positionSubscription;
  AudioPlayerBloc() : super(AudioPlayerInitial()) {
    on<PlayAudioEvent>((event, emit) async {
      try {
        emit(AudioPlayerLoading());
        totalDuration = await player.setAsset(// Load a URL
            'assets/audio/meditation_example.mp3');

        positionSubscription?.cancel();
        positionSubscription =
            player.positionStream.listen((newPosition) async {
          position = newPosition;
          add(ProgressAudioEvent(position: newPosition));
        });
        await player.play();
      } catch (e, stacktrace) {
        print(" ereeeeur : $stacktrace");
      }
    });
    on<PauseAudioEvent>((event, emit) async {
      await player.pause();
      await positionSubscription?.cancel();
      emit(AudioPlayerPaused());
    });
    on<StopAudioEvent>((event, emit) async {
      await player.stop();
      await player.seek(Duration.zero);
      await positionSubscription?.cancel();
      emit(AudioPlayerStopped());
    });

    on<ResumeAudioEvent>((event, emit) async {
      positionSubscription = player.positionStream.listen((newPosition) async {
        position = newPosition;
        add(ProgressAudioEvent(position: newPosition));
      });
      await player.play();
    });
    on<ProgressAudioEvent>(
      (event, emit) {
        emit(AudioPlayerPlaying(
            totalDuration: totalDuration ?? Duration.zero,
            position: event.position));
      },
    );

    @override
    Future<void> close() async {
      positionSubscription?.cancel();
      await player.dispose();
      return super.close();
    }
  }
}
