import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isBuffering = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isBuffering) {
        setState(() {
          _isBuffering = true;
        });
      } else {
        setState(() {
          _isBuffering = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    _controller.setLooping(true);
  }

  bool _isFullScreen = false;
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      SystemChrome.setEnabledSystemUIOverlays(
          _isFullScreen ? [] : [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }

  void _handleDoubleTap() {
    final position = _controller.value.position;
    final duration = _controller.value.duration;

    if (position != null && duration != null) {
      final seekPos = position + Duration(seconds: 10);

      if (seekPos >= duration) {
        _controller.seekTo(duration);
      } else {
        _controller.seekTo(seekPos);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "$twoDigitMinutes:$twoDigitSeconds";
    }

    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: _controller.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTapUp: (details) {
                        double tapPosition = details.localPosition.dx;
                        double screenWidth = MediaQuery.of(context).size.width;
                        double tapPercentage = tapPosition / screenWidth;

                        if (tapPercentage < 0.3) {
                          // Seek backward
                          int newDuration =
                              (_controller.value.position.inSeconds - 10).clamp(
                                  0, _controller.value.duration.inSeconds);
                          _controller.seekTo(Duration(seconds: newDuration));
                        } else if (tapPercentage > 0.7) {
                          // Seek forward
                          int newDuration =
                              (_controller.value.position.inSeconds + 10).clamp(
                                  0, _controller.value.duration.inSeconds);
                          _controller.seekTo(Duration(seconds: newDuration));
                        } else {
                          // Do nothing
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    if (_isBuffering) CircularProgressIndicator(),
                  ],
                )
              : Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatDuration(_controller.value.position),
                    style: TextStyle(color: Colors.black),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Colors.red,
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.yellow[700],
                      overlayColor: Colors.blue[400],
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 14),
                    ),
                    child: Slider(
                      value: _controller.value.position.inSeconds.toDouble(),
                      min: 0.0,
                      max: _controller.value.duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _controller.seekTo(Duration(seconds: value.toInt()));
                      },
                      // divisions: _controller.value.duration.inSeconds.toInt(),
                      // label: _formatDuration(_controller.value.position),
                    ),
                  ),
                  Text(
                    _formatDuration(_controller.value.duration),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                  _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
              onPressed: () {
                _toggleFullScreen();
              },
            ),
          ],
        )
      ],
    );
  }
}
