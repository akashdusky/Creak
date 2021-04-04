import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  CameraViewPage({this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
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
              onPressed: () {
                print(path);
              },
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
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
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
          ],
        ),
      ),
    );
  }
}
