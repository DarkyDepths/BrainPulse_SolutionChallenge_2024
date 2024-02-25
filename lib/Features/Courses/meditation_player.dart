import 'dart:math';

import 'package:brain_pulse/Features/Courses/bloc/audio_player_bloc.dart';
import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class MeditationPlayer extends StatelessWidget {
  const MeditationPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioPlayerBloc(),
      child: const MeditationPlayerUI(),
    );
  }
}

class MeditationPlayerUI extends StatefulWidget {
  const MeditationPlayerUI({
    super.key,
  });

  @override
  State<MeditationPlayerUI> createState() => _MeditationPlayerUIState();
}

class _MeditationPlayerUIState extends State<MeditationPlayerUI> {
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/meditation_background.png"),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyAppBar(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: "Courses",
                ),
                Text(
                  "Mindfulness\nMeditation Intro",
                  style: GoogleFonts.urbanist(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.012,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
                  builder: (context, state) {
                    final position = context.read<AudioPlayerBloc>().position ??
                        Duration.zero;
                    final totalDuration =
                        context.read<AudioPlayerBloc>().totalDuration ??
                            Duration.zero;
                    if (totalDuration != Duration.zero &&
                        totalDuration == position) {
                      context.read<AudioPlayerBloc>().add(StopAudioEvent());
                      // print('stopppeeddd');
                    }
                    print("new state : $state");
                    return Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 90,
                          lineWidth: 15.0,
                          percent: totalDuration == Duration.zero
                              ? 0
                              : min(
                                  1,
                                  position.inMilliseconds /
                                      totalDuration.inMilliseconds),
                          center: state is AudioPlayerLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 5,
                                )
                              : IconButton(
                                  iconSize: 50,
                                  color: Colors.white,
                                  onPressed: () {
                                    final audioPlayerCubit =
                                        context.read<AudioPlayerBloc>();

                                    state is AudioPlayerInitial ||
                                            state is AudioPlayerStopped
                                        ? audioPlayerCubit.add(PlayAudioEvent())
                                        : state is AudioPlayerPaused
                                            ? audioPlayerCubit
                                                .add(ResumeAudioEvent())
                                            : state is AudioPlayerPlaying
                                                ? audioPlayerCubit
                                                    .add(PauseAudioEvent())
                                                : audioPlayerCubit
                                                    .add(RestartAudioEvent());
                                    //TODO:on pause/play pressed
                                  },
                                  icon: Icon(state is AudioPlayerPlaying
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow),
                                ),
                          backgroundColor: Colors.white.withOpacity(0.2),
                          progressColor: Colors.white,
                        ),
                        const Gap(30),
                        Text(
                          formatDuration(position),
                          style: GoogleFonts.urbanist(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.012,
                              color: Colors.white),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 96,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF7F4F2),
                        ),
                        child: Center(
                            child:
                                Image.asset("assets/images/play_button.png")),
                      ),
                      const Gap(15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NEXT COURSE",
                            style: GoogleFonts.urbanist(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.1,
                                color: const Color(0xff926247)),
                          ),
                          Text(
                            "First Session Meditation",
                            style: GoogleFonts.urbanist(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.004,
                                color: const Color(0xff4F3422)),
                          ),
                          Row(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/images/clock.png"),
                                  Text(
                                    "15min",
                                    style: GoogleFonts.urbanist(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.002,
                                        color: const Color(0xff736B66)),
                                  )
                                ],
                              ),
                              const Gap(22),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/images/start1.png"),
                                  Text(
                                    "4.15",
                                    style: GoogleFonts.urbanist(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.002,
                                        color: const Color(0xff736B66)),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
