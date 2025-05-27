import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videoomar extends StatefulWidget {
  const Videoomar({super.key});

  @override
  State<Videoomar> createState() => _InstructionVideoPageState();
}

class _InstructionVideoPageState extends State<Videoomar> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/What_is_Sustainability.mp4',
      )
      ..initialize().then((_) {
        setState(() {});
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('فيديو إرشادي'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                : const CircularProgressIndicator(),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('الانتقال إلى المستوى الأول'),
              onPressed: () {
                Navigator.pushNamed(context, '/level1_14plusomar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
