import 'package:creakchat/Pages/ChatPage.dart';
import 'package:creakchat/Pages/camerapage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creak'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('New group'),
                value: 'New group',
              ),
              PopupMenuItem(
                child: Text('New Broadcast'),
                value: 'New Broadcast',
              ),
              PopupMenuItem(
                child: Text('Creak web'),
                value: 'Creak web',
              ),
              PopupMenuItem(
                child: Text('Starred messasges'),
                value: 'Starred messasges',
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 'Settings',
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              text: 'servers',
            ),
            Tab(
              text: 'DMs',
            ),
            Tab(
              text: 'Frames',
            ),
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text('camera'),
          ChatPage(),
          Text('Status'),
          CameraPage(),
        ],
      ),
    );
  }
}
