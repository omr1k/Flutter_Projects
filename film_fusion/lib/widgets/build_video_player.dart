import 'package:film_fusion/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BuildVideoPlayer extends StatefulWidget {
  final String videoID;
  const BuildVideoPlayer({
    Key? key,
    required this.videoID,
  }) : super(key: key);

  @override
  State<BuildVideoPlayer> createState() => _BuildVideoPlayer();
}

class _BuildVideoPlayer extends State<BuildVideoPlayer> {
  late YoutubePlayerController _controller;
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideThumbnail: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: YoutubePlayer(
        progressIndicatorColor: AppColors.lightGreen,
        progressColors: ProgressBarColors(
            backgroundColor: AppColors.lightGreen.withOpacity(0.5),
            playedColor: AppColors.lightGreen,
            handleColor: AppColors.lightGreen),
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
