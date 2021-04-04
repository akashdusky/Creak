import 'dart:io';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({Key key, this.path}) : super(key: key);
  final String path;

  @override
  _VideoViewPageState createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        print("done");
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                print(_controller.value.initialized);
                print(widget.path);
              },
              icon: Icon(
                Icons.crop,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 150,
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(
                      child: Center(
                          child: Text(
                        "not initialized fml ",
                        style: TextStyle(color: Colors.white),
                      )),
                      color: Colors.black,
                    ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 30, left: 8, right: 8),
                child: TextFormField(
                  minLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 27),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        size: 27,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      hintText: "got something to say ...?",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 19),
                      suffixIcon: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.upcoming),
                        radius: 27,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black45,
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 59,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
