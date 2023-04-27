import 'package:flutter/material.dart';
import 'package:video_player_app/player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Video Player Demo'),
        ),
        body: Center(
          child: VideoPlayerWidget(),
        ),
      ),
    );
  }
}
