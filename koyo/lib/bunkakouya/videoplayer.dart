import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:koyo/widget/widget.dart';
import 'package:video_player/video_player.dart';

//動画再生画面
class Videoplayer extends StatefulWidget {
  const Videoplayer({super.key,required this.title,required this.asset});
  final String title;
  final String asset;

  @override
  VideoplayerState createState() => VideoplayerState();
}

class VideoplayerState extends State<Videoplayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.asset,videoPlayerOptions: VideoPlayerOptions());
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
      // Try playing around with some of these other options:

      //showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.white,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
      optionsTranslation: OptionsTranslation(
        playbackSpeedButtonText: '再生速度',
        cancelButtonText: 'キャンセル',
),
    );
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
     appBar: Bar(title:widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}