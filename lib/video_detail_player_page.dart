import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPlayerPage extends StatefulWidget {
  const VideoDetailPlayerPage({Key? key}) : super(key: key);

  @override
  _VideoDetailPlayerPageState createState() => _VideoDetailPlayerPageState();
}

class _VideoDetailPlayerPageState extends State<VideoDetailPlayerPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _controller = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4')
      ..addListener(() {
        print("监听----------------------");
        setState(() {});
      })
      ..setLooping(true);

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("播放器"),
        ),
        body: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
