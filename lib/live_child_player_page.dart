import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
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
  late HardwareKeyboard hardwareKeyboard;
  double progressValue = 0;
  @override
  void initState() {
    hardwareKeyboard = HardwareKeyboard.instance;
    hardwareKeyboard.addHandler((event) {
      print("event:----${event.toStringShort()}");
      return true;
    });
    super.initState();
    // _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _controller = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4')
      ..addListener(() {
        print("监听----------------------${widget.currentIndex}");
        // print("李大钊--value${_controller.value}");

        setState(() {
          progressValue = _controller.value.position.inSeconds /
              _controller.value.duration.inSeconds;
        });

        ///更新进度条等事件
        ///
      })
      ..setVolume(1)
      ..setLooping(true);

    /// 循环播放

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    hardwareKeyboard.removeHandler((event) => false);
    super.dispose();
  }

//  Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
//           Random().nextInt(256), 1),

  Widget _buildView() {
    return SafeArea(
        child: Container(
      child: Stack(
        /// 铺满
        fit: StackFit.expand,

        children: [
          buildPlayerView(),
          Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: buildGestureContentView()),
        ],
      ),
    ));
  }

  /// 播放器层面
  Widget buildPlayerView() {
    return Container(
        color: Colors.brown,
        child: FutureBuilder(
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
            }));
  }

  /// 点击事件视图
  Widget buildGestureContentView() {
    return GestureDetector(
        onTap: () {
          print("背景单击--------------------------");

          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            // If the video is paused, play it.
            _controller.play();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          // color: Colors.blue,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 100,
                  child: buildBottomContentView()),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  width: 80,
                  child: buildRightEntranceView())
            ],
          ),
        ));
  }

  Widget buildBottomContentView() {
    return Container(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 进度条
          LinearProgressIndicator(
            backgroundColor: Colors.greenAccent,
            value: this.progressValue,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
          Text("天龙八部都有谁看啊"),
          Text("天龙八部都有谁看啊天龙八部都有谁看啊天龙八部都有谁看啊天龙八部都有谁看啊天龙八部都有谁看啊天龙八部都有谁看啊"),
        ],
      ),
    );
  }

  /// 右边入口视图
  Widget buildRightEntranceView() {
    return Container(
      color: Colors.orange,
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("点赞"),
          Text("评论"),
          Text("收藏"),
          Text("转发"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        body: _buildView(),
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
