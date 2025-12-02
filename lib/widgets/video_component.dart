import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../models/page_model.dart';

class VideoComponent extends StatefulWidget {
  final ComponentModel model;

  const VideoComponent({super.key, required this.model});

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    if (widget.model.url == null) return;

    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.model.url!));

    await _videoPlayerController!.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: widget.model.autoPlay,
      looping: widget.model.loop,
      aspectRatio: _videoPlayerController!.value.aspectRatio,
      placeholder: Container(
        color: Colors.black,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.model.url == null) return const SizedBox();

    return Padding(
      padding: EdgeInsets.all(widget.model.padding),
      child: SizedBox(
        height: widget.model.height > 0 ? widget.model.height : 200,
        child: _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : Container(
          height: widget.model.height,
          color: Colors.black12,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}