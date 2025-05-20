import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/app_scaffold.dart';
import 'home_page.dart';

class VideoLearningPage extends StatefulWidget {
  const VideoLearningPage({super.key});

  @override
  _VideoLearningPageState createState() => _VideoLearningPageState();
}

class _VideoLearningPageState extends State<VideoLearningPage> {
  late VideoPlayerController _controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/awareness.mp4')
      ..initialize().then((_) {
        setState(() {
          isInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'التعلم باستخدام الفيديو',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                    Positioned(
                      bottom: 30,
                      child: IconButton(
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            else
              CircularProgressIndicator(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: Text('العودة إلى الصفحة الرئيسية'),
            )
          ],
        ),
      ),
    );
  }
}
