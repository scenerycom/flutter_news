import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  late YoutubePlayerController _youtubeController;
  List<String> _videoIds = [
    'tcodrIK2P_I',
    'H5v3kku4y6Q',
    'nPt8bK2gbaU',
    'K18cpp_-gP8',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _youtubeController = YoutubePlayerController(
      params: YoutubePlayerParams(
        mute: false,
        captionLanguage: 'en',
        enableCaption: true,
        pointerEvents: PointerEvents.initial,
        color: 'white',
        showControls: true,
        // enableKeyboard : kIsWeb,
        enableJavaScript: true,
        showFullscreenButton: false,
        interfaceLanguage: 'en',
        showVideoAnnotations: true,
        loop: false,
        origin: 'https://www.youtube.com',
        playsInline: true,
        strictRelatedVideos: false,
        // userAgent,
      ),
    );

    _youtubeController.setFullScreenListener(
      (isFullScreen) {
        print('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _youtubeController.loadPlaylist(
      list: _videoIds,
      listType: ListType.playlist,
      startSeconds: 136,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("直播间"),
        ),
        body: Container(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
                child: YoutubePlayer(
              controller: _youtubeController,
              aspectRatio: 16 / 9,
            ));
          }),
        ),
      ),
    );
  }
}
