import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

///VideoPlayerPage
///
/// accepts url and appBar for the page
/// uses chewie player
/// used VideoPlayerController to get the aspect ratio of the video and apply it to the video
class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key, required this.url, required this.appBar})
      : super(key: key);

  ///video url
  final String url;

  ///appBar for the page
  final AppBar appBar;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {

  /// VideoPlayerController to get the aspect ratio of the video
  late VideoPlayerController _controller;

  /// chewie video controller for pause, play and more options
  late ChewieController _chewieController;
  late Future<void> _future;

  ///initially VideoPlayerController is initiated followed by  ChewieController initialization
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _future = initVideoPlayer();
  }

  /// videoControlers disposed
  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  ///VideoPlayerController and ChewieController initialization
  Future<void> initVideoPlayer() async {
    await _controller.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: _controller.value.aspectRatio,
        autoPlay: true,
        looping: true,
        placeholder: buildPlaceholderImage(),
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      );
    });
  }

  ///loading during initialization of the controllers
  buildPlaceholderImage() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  ///video controls
  ///
  /// different controls are being called
  /// pause play loading seek full screen and also have option to speed and slow video
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: widget.appBar,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildPlaceholderImage();
                }
                return Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
