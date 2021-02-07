import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:video_player/video_player.dart' as video;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer(this._controller);
  final video.VideoPlayerController _controller;
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  var _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final controller = widget._controller;
    final videoPlayer = video.VideoPlayer(controller);

    return _isPlaying
        ? videoPlayer
        : Stack(
            alignment: Alignment.center,
            children: [
              videoPlayer,
              IconButton(
                onPressed: () {
                  if (!controller.value.isPlaying) {
                    controller.play();
                    Future.delayed(controller.value.duration).then((_) {
                      setState(() => _isPlaying = false);
                    });
                    setState(() => _isPlaying = true);
                  }
                },
                icon: const Icon(LineAwesomeIcons.play),
              ),
            ],
          );
  }
}
