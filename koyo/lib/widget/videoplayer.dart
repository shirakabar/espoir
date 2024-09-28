import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:koyo/widget/widget.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

//動画再生画面
class Videoplayer extends StatefulWidget {
  const Videoplayer({super.key, required this.title, required this.videourl});
  final String title;
  final String videourl;

  @override
  VideoplayerState createState() => VideoplayerState();
}

class VideoplayerState extends State<Videoplayer> {
  VideoPlayerController? _videoPlayerController;  // nullable にする
  ChewieController? _chewieController;  // nullable にする
  Future<void>? _initializeVideoPlayerFuture;

  Future<String> getVideoUrl(String videoPath) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String downloadURL = await storage.ref(videoPath).getDownloadURL();
    return downloadURL;
  }

  Future<void> initialize() async {
    getVideoUrl(widget.videourl).then((videoUrl) {
      debugPrint("Video URL: $videoUrl");  // URL取得のデバッグ用
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl),
          videoPlayerOptions: VideoPlayerOptions());
      _initializeVideoPlayerFuture =
          _videoPlayerController!.initialize().then((_) {
        // ChewieControllerを初期化
         debugPrint("VideoPlayer initialized");  // 初期化完了のデバッグ用
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
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
        setState(() {}); // 初期化が完了したので再描画
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: Bar(title: widget.title),
            body: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Chewie(
                              controller: _chewieController!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
