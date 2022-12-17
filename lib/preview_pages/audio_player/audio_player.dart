import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'audio_player_controller.dart';

class AudioPlayerPage extends StatefulWidget {
  final String url;
  final AppBar appBar;

  const AudioPlayerPage({Key? key, required this.url, required this.appBar})
      : super(key: key);

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late final AudioPlayerController _audioPlayerController;

  @override
  void initState() {
    super.initState();
    _audioPlayerController = AudioPlayerController(widget.url);
  }

  @override
  void dispose() {
    _audioPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: widget.appBar,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Column(
                  children: [
                    ValueListenableBuilder<ProgressBarState>(
                      valueListenable: _audioPlayerController.progressNotifier,
                      builder: (_, value, __) {
                        return ProgressBar(
                          progress: value.current,
                          buffered: value.buffered,
                          total: value.total,
                          onSeek: _audioPlayerController.seek,
                          timeLabelTextStyle:
                              const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    ValueListenableBuilder<ButtonState>(
                      valueListenable: _audioPlayerController.buttonNotifier,
                      builder: (_, value, __) {
                        switch (value) {
                          case ButtonState.loading:
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              width: 32.0,
                              height: 32.0,
                              child: const CircularProgressIndicator(),
                            );
                          case ButtonState.paused:
                            return IconButton(
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              iconSize: 32.0,
                              onPressed: _audioPlayerController.play,
                            );
                          case ButtonState.playing:
                            return IconButton(
                              icon: const Icon(
                                Icons.pause,
                                color: Colors.white,
                              ),
                              iconSize: 32.0,
                              onPressed: _audioPlayerController.pause,
                            );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
              ],
            ),
          ),
        ));
  }
}
