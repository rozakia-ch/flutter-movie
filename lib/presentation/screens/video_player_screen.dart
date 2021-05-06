import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({Key? key, this.controller}) : super(key: key);
  final YoutubePlayerController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: controller!,
              showVideoProgressIndicator: true,
            ),
          ),
          // Positioned(
          //   top: 40.0,
          //   right: 20.0,
          //   child: IconButton(
          //     icon: Icon(
          //       EvaIcons.closeCircle,
          //       color: Colors.white,
          //       size: 30.0,
          //     ),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
