import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveChildPlayerPage extends StatefulWidget {
  LiveChildPlayerPage({Key? key, required this.currentIndex}) : super(key: key);
  int currentIndex = 0;
  @override
  _LiveChildPlayerPageState createState() => _LiveChildPlayerPageState();
}

class _LiveChildPlayerPageState extends State<LiveChildPlayerPage>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _controller = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4')
      ..addListener(() {
        print("监听----------------------${widget.currentIndex}");
        // setState(() {});
      })
      ..setLooping(true);

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//  Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
//           Random().nextInt(256), 1),
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
