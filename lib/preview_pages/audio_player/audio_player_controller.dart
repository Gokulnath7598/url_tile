import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

///AudioPlayerController
///
/// all the audio player controls are handled here
class AudioPlayerController {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  ///audio player controller declaration
  late AudioPlayer _audioPlayer;

  ///calling audio player controller initialization
  AudioPlayerController(String url) {
    _init(url);
  }

  ///audio player controller initialization
  void _init(String url) async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url);

    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  ///play audio function
  void play() {
    _audioPlayer.play();
  }

  ///pause audio function
  void pause() {
    _audioPlayer.pause();
  }

  ///seek audio function
  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  ///dispose audio controller
  void dispose() {
    _audioPlayer.dispose();
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  ///current playing minute of the video
  final Duration current;

  ///minute of the video until which it's loaded
  final Duration buffered;

  /// total length of the video
  final Duration total;
}

///enum
///
/// enum to indicate current status (paused, playing, loading)
enum ButtonState { paused, playing, loading }
